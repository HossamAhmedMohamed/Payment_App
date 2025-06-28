import 'package:flutter/material.dart';
import 'package:payment_app/core/widgets/custom_app_bar.dart';
import 'package:payment_app/features/checkout/presentation/widgets/payment_details_body.dart';

class PaymentDetails extends StatelessWidget {
  const PaymentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(title: "Payment Details"),

      body: PaymentDetailsBody(),
    );
  }
}