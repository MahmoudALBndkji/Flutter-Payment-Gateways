import 'package:flutter/material.dart';
import 'package:flutter_payment_gateways/core/widgets/custom_dashed_line.dart';
import 'package:flutter_payment_gateways/features/checkout/presentation/widgets/thank-you-view/custom_check_icon.dart';
import 'package:flutter_payment_gateways/features/checkout/presentation/widgets/thank-you-view/thank_you_card.dart';

class ThankYouViewBody extends StatelessWidget {
  const ThankYouViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 30.0,
        left: 20.0,
        right: 20.0,
        bottom: 20.0,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          const ThankYouCard(),
          Positioned(
            left: 20 + 8,
            right: 20 + 8,
            bottom: MediaQuery.sizeOf(context).height * .2 + 20,
            child: const CustomDashedLine(),
          ),
          Positioned(
            bottom: MediaQuery.sizeOf(context).height * .2,
            left: -20,
            child: const CircleAvatar(
              backgroundColor: Colors.white,
            ),
          ),
          Positioned(
            bottom: MediaQuery.sizeOf(context).height * .2,
            right: -20,
            child: const CircleAvatar(
              backgroundColor: Colors.white,
            ),
          ),
          const Positioned(
            top: -50,
            left: 0,
            right: 0,
            child: CustomCheckIcon(),
          )
        ],
      ),
    );
  }
}
