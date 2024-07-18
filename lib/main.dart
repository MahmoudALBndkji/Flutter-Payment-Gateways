import 'package:flutter/material.dart';
import 'package:flutter_payment_gateways/core/utils/api_keys.dart';
import 'package:flutter_payment_gateways/features/checkout/presentation/views/my_cart_view.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() async {
  // if main is (async) we used this for check for All
  // in Method is executed and Then Run This Application
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = ApiKeys.stripePublishableKey;
  runApp(const CheckoutApp());
}

class CheckoutApp extends StatelessWidget {
  const CheckoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyCartView(),
    );
  }
}
