import 'package:flutter/material.dart';
import 'package:flutter_payment_gateways/core/widgets/custom_button.dart';
import 'package:flutter_payment_gateways/features/checkout/presentation/widgets/payment-details-view/custom_credit_card.dart';
import 'package:flutter_payment_gateways/features/checkout/presentation/widgets/payment-details-view/payment_methods_list_view.dart';

class PaymentDetailsViewBody extends StatefulWidget {
  const PaymentDetailsViewBody({super.key});

  @override
  State<PaymentDetailsViewBody> createState() => _PaymentDetailsViewBodyState();
}

class _PaymentDetailsViewBodyState extends State<PaymentDetailsViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(child: PaymentMethodsListView()),
        SliverToBoxAdapter(
          child: CustomCreditCard(
            formKey: formKey,
            autoValidateMode: autovalidateMode,
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: CustomButton(
                text: "Payment",
                function: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
