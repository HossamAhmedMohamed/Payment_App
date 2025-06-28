// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_app/core/utils/api_keys.dart';
import 'package:payment_app/core/utils/api_service.dart';
import 'package:payment_app/features/checkout/data/models/ephemeral_key_models/ephemeral_key_models.dart';
import 'package:payment_app/features/checkout/data/models/init_payment_sheet_input_model.dart';
import 'package:payment_app/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:payment_app/features/checkout/data/models/payment_intent_model/payment_intent_model.dart';

class StripeService {
  final ApiService apiService = ApiService();

  Future<PaymentIntentModel> createPaymentIntent(
    PaymentIntentInputModel paymentIntentInputModel,
  ) async {
    final response = await apiService.post(
      body: paymentIntentInputModel.toJson(),
      url: 'https://api.stripe.com/v1/payment_intents',
      contentType: Headers.formUrlEncodedContentType,
      token: ApiKeys.secretKey,
    );

    return PaymentIntentModel.fromJson(response.data);
  }

  Future initPaymentSheet({required InitPaymentSheetInputModel initPaymentSheetInputModel}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: initPaymentSheetInputModel.clientSecret,
        customerEphemeralKeySecret: initPaymentSheetInputModel.ephemeralKeySecret,
        customerId: initPaymentSheetInputModel.customerId,
        merchantDisplayName: 'Hossam',
      ),
    );
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }


  Future makePayment({required PaymentIntentInputModel paymentIntentInputModel}) async{

    var paumentIntentModel = await createPaymentIntent(paymentIntentInputModel);
    var ephemeralKeyModel = await createEphemeralKey(customerId: paymentIntentInputModel.customerId);
    await initPaymentSheet(
       initPaymentSheetInputModel: InitPaymentSheetInputModel(
        clientSecret: paumentIntentModel.clientSecret!,
        ephemeralKeySecret: ephemeralKeyModel.secret,
        customerId: paymentIntentInputModel.customerId,
      ),
    );

    await displayPaymentSheet();
  }

  Future<EphemeralKeyModels> createEphemeralKey(
     {required String customerId}
  ) async {
    final response = await apiService.post(
      body: {
        'customer': customerId,
      },

      url: 'https://api.stripe.com/v1/ephemeral_keys',
      contentType: Headers.formUrlEncodedContentType,
      token: ApiKeys.secretKey,
      headers: {
        "Authorization": "Bearer ${ApiKeys.secretKey}",
        "Stripe-Version": "2025-05-28.basil",
      }
    );

    return EphemeralKeyModels.fromJson(response.data);
  }
}
