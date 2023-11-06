import 'package:flutter/material.dart';
import 'package:payment_app/core/utils/styles.dart';

class PaymentItemInfo extends StatelessWidget {
  const PaymentItemInfo(
      {super.key, required this.text, required this.textBold});
  final String text;
  final String textBold;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: styles.style18,
        ),
        Text(
          textBold,
          style: styles.style18Bold,
        ),
      ],
    );
  }
}
