import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class CustomCreditCard extends StatefulWidget {
  const CustomCreditCard({
    super.key,
    required this.formKey,
    required this.autoValidateMode,
  });

  final GlobalKey<FormState> formKey;
  final AutovalidateMode autoValidateMode;
  @override
  State<CustomCreditCard> createState() => _CustomCreditCardState();
}

class _CustomCreditCardState extends State<CustomCreditCard> {
  String cardNumber = '', expiryDate = '', cardHolderName = '', cvvCode = '';
  bool showBackView = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CreditCardWidget(
          cvvCode: cvvCode,
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          isHolderNameVisible: true,
          showBackView: showBackView,
          cardHolderName: cardHolderName,
          onCreditCardWidgetChange: (value) {},
        ),
        CreditCardForm(
          cvvCode: cvvCode,
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          formKey: widget.formKey,
          cardHolderName: cardHolderName,
          autovalidateMode: widget.autoValidateMode,
          onCreditCardModelChange: (creditCardModel) {
            cvvCode = creditCardModel.cvvCode;
            cardNumber = creditCardModel.cardNumber;
            expiryDate = creditCardModel.expiryDate;
            showBackView = creditCardModel.isCvvFocused;
            cardHolderName = creditCardModel.cardHolderName;
            setState(() {});
          },
        ),
      ],
    );
  }
}
