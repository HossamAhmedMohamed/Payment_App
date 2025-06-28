import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/core/utils/payment_services/pay_pal_service.dart';
import 'package:payment_app/core/widgets/custom_button.dart';
import 'package:payment_app/features/checkout/presentation/cubit/stripe_cubit/stripe_cubit.dart';
import 'package:payment_app/features/checkout/presentation/screens/thank_you_screen.dart';
import 'package:payment_app/features/checkout/presentation/widgets/execute_paymob_integration.dart';
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
                : executePayMobPayment(context);
          },
          text: 'Continue',
        );
      },
    );
  }
}
