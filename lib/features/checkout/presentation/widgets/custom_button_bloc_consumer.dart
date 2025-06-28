
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/core/widgets/custom_button.dart';
import 'package:payment_app/features/checkout/data/models/amount_model/amount_model.dart';
import 'package:payment_app/features/checkout/data/models/amount_model/details.dart';
import 'package:payment_app/features/checkout/data/models/item_list/item.dart';
import 'package:payment_app/features/checkout/data/models/item_list/item_list.dart';
import 'package:payment_app/features/checkout/presentation/cubit/stripe_cubit/stripe_cubit.dart';
import 'package:payment_app/features/checkout/presentation/screens/thank_you_screen.dart';
import 'package:payment_app/features/checkout/presentation/widgets/paypal_navigation.dart';
import 'package:payment_app/features/checkout/presentation/widgets/stripe_navigation.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({super.key, required this.paymentMethodIndex});

  final int paymentMethodIndex;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StripeCubit, StripeState>(
      listener: (context, state) {
        if (state is StripeSuccess) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const ThankYouScreen()),
          );
        }

        if (state is StripeFailure) {
          Navigator.pop(context);
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errMessage)));
        }
      },
      builder: (context, state) {
        return CustomButton(
          isLoading: state is StripeLoading ? true : false,

          onTap: () {
            paymentMethodIndex == 0
                ? executeStripePayment(context)
                : paymentMethodIndex == 1
                ? executePaypalPayment(context, getTransactionData())
                : null;
          },
          text: 'Continue',
        );
      },
    );
  }

  ({AmountModel amount, ItemListModel itemList}) getTransactionData() {
    var amount = AmountModel(
      total: '100',
      currency: 'USD',
      details: Details(subtotal: '100', shipping: '0', shippingDiscount: 0),
    );

    List<OrderItemModel> orders = [
      OrderItemModel(name: 'Apple', quantity: 4, price: '10', currency: 'USD'),
      OrderItemModel(
        name: 'Pineapple',
        quantity: 5,
        price: '12',
        currency: 'USD',
      ),
    ];

    var itemList = ItemListModel(orders: orders);

    return (amount: amount, itemList: itemList);
  }
}
