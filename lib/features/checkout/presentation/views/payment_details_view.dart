import 'package:flutter/material.dart';
import 'package:flutter_payment_gateways/core/widgets/custom_app_bar.dart';
import 'package:flutter_payment_gateways/features/checkout/presentation/widgets/payment-details-view/payment_details_view_body.dart';

class PaymentDetailsView extends StatelessWidget {
  const PaymentDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(title: "Payment Details"),
      body: const PaymentDetailsViewBody(),
    );
  }
}
