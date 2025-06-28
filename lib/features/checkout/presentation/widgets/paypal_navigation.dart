import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:payment_app/core/utils/api_keys.dart';
import 'package:payment_app/features/checkout/data/models/amount_model/amount_model.dart';
import 'package:payment_app/features/checkout/data/models/item_list/item_list.dart';
import 'package:payment_app/features/checkout/presentation/screens/my_cart.dart';
import 'package:payment_app/features/checkout/presentation/screens/thank_you_screen.dart';

void executePaypalPayment(
    BuildContext context,
    ({AmountModel amount, ItemListModel itemList}) transactionData,
  ) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder:
            (BuildContext context) => PaypalCheckoutView(
              sandboxMode: true,
              clientId: ApiKeys.clientId,
              secretKey: ApiKeys.secretKeyPaypal,
              transactions: [
                {
                  "amount": transactionData.amount.toJson(),
                  "description": "The payment transaction description.",

                  "item_list": transactionData.itemList.toJson(),
                },
              ],
              note: "Contact us for any questions on your order.",
              onSuccess: (Map params) async {
                log("onSuccess: $params");
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ThankYouScreen(),
                  ),
                  (route) {
                    if (route.settings.name == '/') {
                      return true;
                    } else {
                      return false;
                    }
                  },
                );
              },
              onError: (error) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(error.toString())));
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const MyCartScreen()),
                  (route) => false,
                );
              },
              onCancel: () {
                Navigator.pop(context);
              },
            ),
      ),
    );
  }