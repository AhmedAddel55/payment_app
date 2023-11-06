import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:payment_app/core/utils/styles.dart';

class CardItemWidget extends StatelessWidget {
  const CardItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 305,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 23),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.white),
      child: Row(children: [
        SvgPicture.asset('assets/images/logo.svg'),
        const SizedBox(
          width: 23,
        ),
        const Text(
          "Credit Card Mastercard **78 ",
          style: styles.style18,
        )
      ]),
    );
  }
}
