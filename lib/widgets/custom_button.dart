import 'package:flutter/material.dart';
import 'package:payment_app/core/utils/styles.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton({
    required this.onTap,
    super.key,
    required this.text,
    this.isLoading = false,
  });
  void Function() onTap;
  final String text;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // ignore: sort_child_properties_last
        child: Center(
          child: isLoading
              ? const CircularProgressIndicator()
              : Text(
                  text,
                  textAlign: TextAlign.center,
                  style: styles.style22Bold,
                ),
        ),
        width: double.infinity,
        height: 73,
        decoration: ShapeDecoration(
          color: const Color(0xFF34A853),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
