import 'package:flutter/material.dart';
import 'package:flutter_payment_gateways/core/utils/assets.dart';
import 'package:flutter_payment_gateways/core/utils/styles.dart';
import 'package:flutter_svg/svg.dart';

class CardInfoWidget extends StatelessWidget {
  const CardInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: 22.0,
        vertical: 16.0,
      ),
      width: 305,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
      child: Row(
        children: [
          SvgPicture.asset(AssetsImage.masterCard),
          const SizedBox(width: 23.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Credit Card", style: Styles.style20),
              const Text("Master Card **78", style: Styles.style18),
            ],
          ),
        ],
      ),
    );
  }
}
