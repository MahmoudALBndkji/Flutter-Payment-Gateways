class PaymentIntentInputModel {
  final String amount;
  final String currency;

  PaymentIntentInputModel({required this.amount, required this.currency});
  toJson() => {
        "amount": (num.parse(amount) * 100).toString(),
        // "amount": '${amount}00',
        "currency": currency,
      };
}
