import 'package:flutter/material.dart';
import 'package:payment_app/core/widgets/custom_button.dart';
import 'package:payment_app/features/checkout/presentation/widgets/payment_method_list_view.dart';

class PaymentMethodBottomSheet extends StatelessWidget {
  const PaymentMethodBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PaymentMethodListView(),

          const SizedBox(height: 32),

          CustomButton(text: 'Continue')
        ],
      ),
    );
  }
}
