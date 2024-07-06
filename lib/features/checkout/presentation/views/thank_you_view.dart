import 'package:flutter/material.dart';
import 'package:flutter_payment_gateways/core/widgets/custom_app_bar.dart';
import 'package:flutter_payment_gateways/features/checkout/presentation/widgets/thank-you-view/thank_you_view_body.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: Transform.translate(
        offset: const Offset(0, -32),
        child: const ThankYouViewBody(),
      ),
    );
  }
}
