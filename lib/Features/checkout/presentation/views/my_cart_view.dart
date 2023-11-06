import 'package:flutter/material.dart';
import 'package:payment_app/Features/checkout/presentation/views/my_cart_view_body.dart';
// ignore: unused_import
import 'package:payment_app/core/utils/styles.dart';
import 'package:payment_app/widgets/bulid_app_bar.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildAppBar(title: 'My Cart'),
      body: const MyCartViewBody(),
    );
  }
}
