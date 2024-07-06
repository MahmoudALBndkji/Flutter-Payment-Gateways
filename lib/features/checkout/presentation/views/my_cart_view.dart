import 'package:flutter/material.dart';
import 'package:flutter_payment_gateways/core/widgets/custom_app_bar.dart';
import 'package:flutter_payment_gateways/features/checkout/presentation/widgets/my-cart-view/my_cart_view_body.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(title: "My Cart"),
      body: const MyCartViewBody(),
    );
  }
}
