import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/features/checkout/presentation/cubit/toggle_payment_cubit/payment_method_cubit.dart';
import 'package:payment_app/features/checkout/presentation/widgets/custom_button_bloc_consumer.dart';

class CustomButtonTogglePaymentMethod extends StatelessWidget {
  const CustomButtonTogglePaymentMethod({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: BlocBuilder<PaymentMethodCubit, int>(
        builder: (context, state) {
          return CustomButtonBlocConsumer(
            paymentMethodIndex: state,
          );
        },
      ),
    );
  }
}
