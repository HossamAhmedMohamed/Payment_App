 
import 'package:flutter_bloc/flutter_bloc.dart';
part 'payment_method_state.dart';

class PaymentMethodCubit extends Cubit<int> {
  PaymentMethodCubit() : super((0));

  int paymentMethodIndex = 0;
  void togglePaymentMethod(int index) {
    paymentMethodIndex = index;
    emit(paymentMethodIndex);
  }
}
