import 'package:flutter/material.dart';
import 'package:flutter_payment_gateways/features/checkout/presentation/widgets/my-cart-view/custom_button_bloc_consumer.dart';
import 'package:flutter_payment_gateways/features/checkout/presentation/widgets/payment-details-view/payment_methods_list_view.dart';

class PaymentMethodsBottomSheet extends StatelessWidget {
  const PaymentMethodsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 16.0),
          PaymentMethodsListView(),
          SizedBox(height: 32.0),
          CustomButtonBlocConsumer(),
        ],
      ),
    );
  }
}
