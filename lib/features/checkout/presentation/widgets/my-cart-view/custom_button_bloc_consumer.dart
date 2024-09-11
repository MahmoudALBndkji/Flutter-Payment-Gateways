import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_payment_gateways/core/widgets/custom_button.dart';
import 'package:flutter_payment_gateways/features/checkout/data/models/amount_model/amount_model.dart';
import 'package:flutter_payment_gateways/features/checkout/data/models/amount_model/details.dart';
import 'package:flutter_payment_gateways/features/checkout/data/models/item_list_model/item.dart';
import 'package:flutter_payment_gateways/features/checkout/data/models/item_list_model/item_list_model.dart';
import 'package:flutter_payment_gateways/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:flutter_payment_gateways/features/checkout/presentation/manager/cubit/payment_cubit.dart';
import 'package:flutter_payment_gateways/features/checkout/presentation/views/thank_you_view.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const ThankYouView(),
            ),
          );
        } else if (state is PaymentFailure) {
          debugPrint('PaymentFailure): ${state.errMessage}');
          Navigator.of(context).pop();
          SnackBar snackBar = SnackBar(content: Text(state.errMessage));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        return CustomButton(
          function: () {
            // PaymentIntentInputModel paymentIntentInputModel =
            //     PaymentIntentInputModel(
            //   amount: '100',
            //   currency: 'USD',
            //   customerId: 'cus_QkrNshCjfcu4ai',
            // );
            // BlocProvider.of<PaymentCubit>(context)
            //     .makePayment(paymentIntentInputModel: paymentIntentInputModel);
            // ?
            var amount = AmountModel(
              currency: 'USD',
              total: "100",
              details: Details(
                shipping: "0",
                shippingDiscount: 0,
                subtotal: "100",
              ),
            );
            List<OrderItemModel> orders = [
              OrderItemModel(
                currency: "USD",
                name: "Apple",
                price: "4",
                quantity: 10,
              ),
              OrderItemModel(
                currency: "USD",
                name: "Apple",
                price: "5",
                quantity: 12,
              ),
            ];
            var itemList = ItemListModel(orders: orders);
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => PaypalCheckoutView(
                  sandboxMode: true,
                  clientId: "YOUR CLIENT ID",
                  secretKey: "YOUR SECRET KEY",
                  transactions: [
                    {
                      "amount": amount.toJson(),
                      "description": "The payment transaction description.",
                      "item_list": itemList.toJson(),
                    }
                  ],
                  note: "Contact us for any questions on your order.",
                  onSuccess: (Map params) async {
                    log("onSuccess: $params");
                    Navigator.pop(context);
                  },
                  onError: (error) {
                    log("onError: $error");
                    Navigator.pop(context);
                  },
                  onCancel: () {
                    log('cancelled:');
                    Navigator.pop(context);
                  },
                ),
              ),
            );
          },
          isLoading: state is PaymentLoading ? true : false,
          text: 'Continue',
        );
      },
    );
  }
}
