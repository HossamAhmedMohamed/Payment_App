import 'package:flutter/material.dart';
import 'package:payment_app/features/checkout/presentation/widgets/payments_methods.dart';

class PaymentMethodListView extends StatefulWidget {
  const PaymentMethodListView({super.key});

  @override
  State<PaymentMethodListView> createState() => _PaymentMethodListViewState();
}

class _PaymentMethodListViewState extends State<PaymentMethodListView> {
  final List<String> paymentMethods = [
    "assets/images/card.svg",
    "assets/images/paypal.svg",
    "assets/images/apple_paysvg.svg",
  ];

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemCount: paymentMethods.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: PaymentsMethod(image: paymentMethods[index], isActive: selectedIndex == index),
          ),
        )),
    );
  }
}
