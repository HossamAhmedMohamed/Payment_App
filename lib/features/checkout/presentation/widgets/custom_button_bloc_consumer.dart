import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/core/widgets/custom_button.dart';
import 'package:payment_app/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:payment_app/features/checkout/presentation/cubit/stripe_cubit.dart';
import 'package:payment_app/features/checkout/presentation/screens/thank_you_screen.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({super.key});

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
            PaymentIntentInputModel paymentIntentInputModel =
                PaymentIntentInputModel(
                  amount: '100',
                  currency: 'USD', 
                  customerId: 'cus_SZ9HjS8oX7atb9', 
                );
            BlocProvider.of<StripeCubit>(
              context,
            ).makePayment(paymentIntentInputModel: paymentIntentInputModel);
          },
          text: 'Continue',
        );
      },
    );
  }
}
