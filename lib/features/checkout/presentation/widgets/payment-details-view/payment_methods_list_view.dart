import 'package:flutter/material.dart';
import 'package:flutter_payment_gateways/core/utils/assets.dart';
import 'package:flutter_payment_gateways/features/checkout/presentation/widgets/payment-details-view/payment_method_item.dart';

class PaymentMethodsListView extends StatefulWidget {
  const PaymentMethodsListView({super.key});

  @override
  State<PaymentMethodsListView> createState() => _PaymentMethodsListViewState();
}

class _PaymentMethodsListViewState extends State<PaymentMethodsListView> {
  final List<String> paymentMethodItems = const [
    AssetsImage.card,
    AssetsImage.paypal,
  ];
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SizedBox(
        height: 62,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: paymentMethodItems.length,
          separatorBuilder: (context, index) => const SizedBox(width: 20.0),
          itemBuilder: (context, index) => GestureDetector(
            onTap: () => setState(() => activeIndex = index),
            child: PaymentMethodItem(
              image: paymentMethodItems[index],
              isActive: activeIndex == index,
            ),
          ),
        ),
      ),
    );
  }
}
