import 'package:flutter/material.dart';
import 'package:payment_app/Features/checkout/presentation/Thank_you_view_body.dart';
import 'package:payment_app/widgets/bulid_app_bar.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildAppBar(),
      body: const ThankYouViewBody(),
    );
  }
}
