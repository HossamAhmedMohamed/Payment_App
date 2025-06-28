part of 'stripe_cubit.dart';

sealed class StripeState {}

final class StripeInitial extends StripeState {}

final class StripeLoading extends StripeState {}

final class StripeSuccess extends StripeState {}

final class StripeFailure extends StripeState {
  final String errMessage;

  StripeFailure(this.errMessage);
}
