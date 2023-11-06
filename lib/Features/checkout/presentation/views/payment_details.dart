import 'package:flutter/material.dart';
import 'package:payment_app/Features/checkout/presentation/views/payment_details_view_body.dart';
import 'package:payment_app/widgets/bulid_app_bar.dart';

class PatmentDetailsView extends StatelessWidget {
  const PatmentDetailsView({super.key});
  static String id = 'PatmentDetailsView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildAppBar(
        title: 'Payment Details',
      ),
      body: const PaymentDetailsBody(),
    );
  }
}
