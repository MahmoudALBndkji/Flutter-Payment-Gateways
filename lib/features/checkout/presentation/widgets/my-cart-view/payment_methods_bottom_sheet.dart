import 'package:flutter/material.dart';
import 'package:flutter_payment_gateways/core/widgets/custom_button.dart';
import 'package:flutter_payment_gateways/features/checkout/presentation/views/thank_you_view.dart';
import 'package:flutter_payment_gateways/features/checkout/presentation/widgets/payment-details-view/payment_methods_list_view.dart';

class PaymentMethodsBottomSheet extends StatelessWidget {
  const PaymentMethodsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 16.0),
          const PaymentMethodsListView(),
          const SizedBox(height: 32.0),
          CustomButton(
              function: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ThankYouView(),
                    ),
                  ),
              text: 'Continue'),
        ],
      ),
    );
  }
}
