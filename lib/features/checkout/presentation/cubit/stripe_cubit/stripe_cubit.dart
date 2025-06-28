// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/features/checkout/data/models/payment_intent_input_model.dart';

import 'package:payment_app/features/checkout/data/repository/check_out_repo.dart';

part 'stripe_state.dart';

class StripeCubit extends Cubit<StripeState> {
  StripeCubit(this.checkOutRepo) : super(StripeInitial());

  final CheckOutRepo checkOutRepo;

  Future makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    emit(StripeLoading());

    var res = await checkOutRepo.makePayment(
      paymentIntentInputModel: paymentIntentInputModel,
    );
    res.fold(
      (failure) {
        emit(StripeFailure(failure.errMessage));
      },
      (success) {
        emit(StripeSuccess());
      },
    );
  }

  @override
  void onChange(Change<StripeState> change) {
    log(change.toString());
    super.onChange(change);
  }
}
