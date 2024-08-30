import 'package:dio/dio.dart';
import 'package:flutter_payment_gateways/core/utils/api_keys.dart';
import 'package:flutter_payment_gateways/core/utils/api_service.dart';
import 'package:flutter_payment_gateways/features/checkout/data/models/ephermeral_key_model/ephermeral_key_model.dart';
import 'package:flutter_payment_gateways/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:flutter_payment_gateways/features/checkout/data/models/payment_intent_model/payment_intent_model.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeService {
  final ApiService apiService = ApiService();

  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    var response = await apiService.post(
      contentType: Headers.formUrlEncodedContentType,
      body: paymentIntentInputModel.toJson(),
      url: 'https://api.stripe.com/v1/payment_intents',
      token: ApiKeys.secrectKey,
    );
    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);
    return paymentIntentModel;
  }

  Future initPaymentSheet({required String paymentIntentClientSecret}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: paymentIntentClientSecret,
        merchantDisplayName: 'Dosto Fiskei',
      ),
    );
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);
    await initPaymentSheet(
      paymentIntentClientSecret: paymentIntentModel.clientSecret!,
    );
    await displayPaymentSheet();
  }

  Future<EphermeralKeyModel> createEphemeralKey(
      {required String customerId}) async {
    var response = await apiService.post(
      contentType: Headers.formUrlEncodedContentType,
      body: {
        "customer": customerId,
      },
      url: 'https://api.stripe.com/v1/ephemeral_keys',
      token: ApiKeys.secrectKey,
      headers: {
        "Authorization": "Bearer ${ApiKeys.secrectKey}",
        "Stripe-Version": "2024-06-20",
      },
    );
    var ephermeralKeyModel = EphermeralKeyModel.fromJson(response.data);
    return ephermeralKeyModel;
  }
}
