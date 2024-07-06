import 'package:flutter/material.dart';
import 'package:flutter_payment_gateways/core/utils/assets.dart';
import 'package:flutter_payment_gateways/core/widgets/custom_button.dart';
import 'package:flutter_payment_gateways/features/checkout/presentation/widgets/my-cart-view/order_info_item.dart';
import 'package:flutter_payment_gateways/features/checkout/presentation/widgets/my-cart-view/payment_methods_bottom_sheet.dart';
import 'package:flutter_payment_gateways/features/checkout/presentation/widgets/my-cart-view/total_price.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          const SizedBox(height: 18.0),
          Expanded(child: Image.asset(AssetsImage.basketImage)),
          const SizedBox(height: 25.0),
          const OrderInfoItem(title: "Order Subtotal", value: "42.97"),
          const SizedBox(height: 3.0),
          const OrderInfoItem(title: "Discount", value: "0"),
          const SizedBox(height: 3.0),
          const OrderInfoItem(title: "Shipping", value: "8"),
          const Divider(
            thickness: 2.0,
            height: 34.0,
            color: Color(0xffC7C7C7),
          ),
          const TotalPrice(title: "Total", value: "50.97"),
          const SizedBox(height: 16.0),
          CustomButton(
            text: "Complete Payment",
            function: () => showModalBottomSheet(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              context: context,
              builder: (context) => const PaymentMethodsBottomSheet(),
            ),
          ),
          const SizedBox(height: 12.0),
        ],
      ),
    );
  }
}
