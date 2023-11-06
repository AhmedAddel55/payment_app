import 'package:flutter/material.dart';
import 'package:payment_app/Features/checkout/presentation/payment_method_list_view.dart';
// ignore: unused_import
import 'package:payment_app/widgets/custom_button.dart';
import 'package:payment_app/widgets/custom_button_bloc_consumer.dart';

class PaymentMethodButtonSheet extends StatelessWidget {
  const PaymentMethodButtonSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 16,
          ),
          PaymentMethodsListView(),
          const SizedBox(
            height: 32,
          ),
          const CustomButtonBlocConsumer()
        ],
      ),
    );
  }
}
