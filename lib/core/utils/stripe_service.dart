import 'package:flutter_payment_gateways/core/utils/api_keys.dart';
import 'package:flutter_payment_gateways/core/utils/api_service.dart';
import 'package:flutter_payment_gateways/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:flutter_payment_gateways/features/checkout/data/models/payment_intent_model/payment_intent_model.dart';

class StripeService {
  final ApiService apiService = ApiService();

  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    var response = await apiService.post(
      body: paymentIntentInputModel.toJson(),
      url: 'https://api.stripe.com/v1/payment_intents',
      token: ApiKeys.secrectKey,
    );
    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);
    return paymentIntentModel;
  }
}
