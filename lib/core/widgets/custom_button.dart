import 'package:flutter/material.dart';
import 'package:flutter_payment_gateways/core/utils/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.function,
    required this.text,
    this.isLoading = false,
  });
  final VoidCallback function;
  final String text;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60.0,
      child: ElevatedButton(
        onPressed: function,
        style: ButtonStyle(
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          backgroundColor: const WidgetStatePropertyAll(Color(0xff34A853)),
        ),
        child: isLoading
            ? const CircularProgressIndicator.adaptive()
            : Text(
                text,
                textAlign: TextAlign.center,
                style: Styles.style22,
              ),
      ),
    );
  }
}
