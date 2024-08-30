class PaymentIntentInputModel {
  final String amount;
  final String currency;
  final String customerId;

  PaymentIntentInputModel({
    required this.amount,
    required this.currency,
    required this.customerId,
  });
  toJson() => {
        "amount": (num.parse(amount) * 100).toString(),
        // "amount": '${amount}00',
        "currency": currency,
        "customer": customerId,
      };
}
