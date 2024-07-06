import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_payment_gateways/core/utils/styles.dart';
import 'package:flutter_payment_gateways/features/checkout/presentation/widgets/my-cart-view/total_price.dart';
import 'package:flutter_payment_gateways/features/checkout/presentation/widgets/thank-you-view/card_info_widget.dart';
import 'package:flutter_payment_gateways/features/checkout/presentation/widgets/thank-you-view/payment_item_info.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ThankYouCard extends StatelessWidget {
  const ThankYouCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        color: const Color(0xffDEDEDE),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 50 + 16, left: 22.0, right: 22.0),
        child: Column(
          children: [
            const Text(
              "Thank you!",
              textAlign: TextAlign.center,
              style: Styles.style25,
            ),
            Text(
              "Your transaction was successful",
              textAlign: TextAlign.center,
              style: Styles.style20
                  .copyWith(color: Colors.black.withOpacity(0.800000011920929)),
            ),
            const SizedBox(height: 42.0),
            const PaymentItemInfo(title: "Date", value: "01/24/2023"),
            const SizedBox(height: 20.0),
            const PaymentItemInfo(title: "Time", value: "10:15 Am"),
            const SizedBox(height: 20.0),
            const PaymentItemInfo(title: "To", value: "Sam Louis"),
            const Divider(
              thickness: 2,
              height: 60.0,
            ),
            const TotalPrice(title: "Total", value: "50.97"),
            const SizedBox(height: 30.0),
            const CardInfoWidget(),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  FontAwesomeIcons.barcode,
                  size: 64,
                ),
                Container(
                  width: 113,
                  height: 58,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        width: 1.50,
                        color: Color(0xff34A853),
                      ),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "PAID",
                      textAlign: TextAlign.center,
                      style: Styles.style24.copyWith(
                        color: const Color(0xff34A853),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: ((MediaQuery.sizeOf(context).height * .2 + 20) / 2) - 29,
            )
          ],
        ),
      ),
    );
  }
}
