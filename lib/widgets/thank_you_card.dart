// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payment_app/core/utils/styles.dart';
import 'package:payment_app/widgets/card_item_widget.dart';
import 'package:payment_app/widgets/payment_item_info.dart';
import 'package:payment_app/widgets/total_price.dart';

class ThankYouCard extends StatelessWidget {
  const ThankYouCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        // ignore: prefer_const_constructors
        color: Color(0xFFEDEDED),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 50 + 16, left: 22, right: 22),
        child: Column(
          children: [
            const Text(
              "Thank you!",
              style: styles.style25,
            ),
            Text(
              "Your transaction was successful",
              style: styles.style20,
            ),
            const SizedBox(
              height: 42,
            ),
            const PaymentItemInfo(
              text: "Date",
              textBold: "01/24/2023",
            ),
            const SizedBox(
              height: 20,
            ),
            const PaymentItemInfo(
              text: "Time",
              textBold: "10:15 AM",
            ),
            const SizedBox(
              height: 20,
            ),
            const PaymentItemInfo(
              text: "To",
              textBold: "Sam Louis",
            ),
            const Divider(
              height: 60,
              thickness: 2,
            ),
            const TotalPrice(title: 'Total', value: r'50.97$'),
            const SizedBox(
              height: 30,
            ),
            const CardItemWidget(),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset('assets/images/SVGRepo_iconCarrier.svg'),
                Container(
                  width: 113,
                  height: 58,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          width: 1.50, color: Color(0xFF34A853)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'PAID',
                      textAlign: TextAlign.center,
                      style: styles.style24Bold.copyWith(
                        color: const Color(0xff34A853),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: ((MediaQuery.sizeOf(context).height * .2 + 20) / 2) - 29,
            ),
          ],
        ),
      ),
    );
  }
}
