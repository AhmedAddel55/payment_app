import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_credit_card/flutter_credit_card.dart';
// ignore: unused_import
import 'package:flutter_svg/flutter_svg.dart';
import 'package:payment_app/Features/checkout/presentation/custom_credit_card.dart';
import 'package:payment_app/Features/checkout/presentation/payment_method_list_view.dart';
import 'package:payment_app/Features/checkout/presentation/thank_you_view.dart';
// ignore: unused_import
import 'package:payment_app/Features/checkout/presentation/views/payment_method_item.dart';
// ignore: unused_import
import 'package:payment_app/widgets/custom_button.dart';

class PaymentDetailsBody extends StatefulWidget {
  const PaymentDetailsBody({super.key});

  @override
  State<PaymentDetailsBody> createState() => _PaymentDetailsBodyState();
}

class _PaymentDetailsBodyState extends State<PaymentDetailsBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverToBoxAdapter(
        child: PaymentMethodsListView(),
      ),
      SliverToBoxAdapter(
        child: CustomCreditCard(
          autovalidateMode: autovalidateMode,
          formKey: formKey,
        ),
      ),
      SliverFillRemaining(
          hasScrollBody: false,
          child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 60),
                child: CustomButton(
                  text: 'Pay',
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                    } else {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return const ThankYouView();
                          },
                        ),
                      );
                      autovalidateMode = AutovalidateMode.always;
                    }
                  },
                ),
              ))),
    ]);
  }
}
