import 'package:flutter/material.dart';
import 'package:payment_app/Features/checkout/presentation/views/payment_method_item.dart';

class PaymentMethodsListView extends StatefulWidget {
  PaymentMethodsListView({
    super.key,
  });

  @override
  State<PaymentMethodsListView> createState() => _PaymentMethodsListViewState();
}

class _PaymentMethodsListViewState extends State<PaymentMethodsListView> {
  final List<String> paymentMethodsItem = const [
    'assets/images/card.svg',
    'assets/images/paypal.svg',
    'assets/images/applepay.svg'
  ];
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: ListView.builder(
        itemCount: paymentMethodsItem.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: GestureDetector(
              onTap: () {
                activeIndex = index;
                setState(() {});
              },
              child: PaymentMethodItem(
                isActive: activeIndex == index,
                image: paymentMethodsItem[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
