import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:payment_app/features/checkout/presentation/cubit/stripe_cubit/stripe_cubit.dart';

void executeStripePayment(BuildContext context) {
  PaymentIntentInputModel paymentIntentInputModel = PaymentIntentInputModel(
    amount: '100',
    currency: 'USD',
    customerId: 'cus_SZ9HjS8oX7atb9',
  );
  BlocProvider.of<StripeCubit>(
    context,
  ).makePayment(paymentIntentInputModel: paymentIntentInputModel);
}
