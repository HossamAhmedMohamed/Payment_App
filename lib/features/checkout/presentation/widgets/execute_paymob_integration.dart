import 'package:flutter/material.dart';
import 'package:payment_app/core/utils/payment_services/pay_mob_service.dart';
import 'package:payment_app/features/checkout/presentation/screens/pay_mob_checkout_screen.dart';

executePayMobPayment(BuildContext context) {
    // Assuming you have a PayMobService class to handle PayMob payments
    PayMobService payMobService = PayMobService();

    payMobService.getPaymentKey(100, "EGP").then((paymentKey) {
      if (!context.mounted) return;

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PayMobCheckoutScreen(paymentKey: paymentKey),
        ),
      );
    });
  }