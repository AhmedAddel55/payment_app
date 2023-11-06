import 'package:flutter/material.dart';
import 'package:payment_app/core/utils/styles.dart';

// ignore: non_constant_identifier_names
AppBar BuildAppBar({final String? title}) {
  return AppBar(
    leading: const Icon(
      Icons.arrow_back_ios_new_outlined,
      color: Colors.black,
    ),
    centerTitle: true,
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Text(
      title ?? '',
      textAlign: TextAlign.center,
      style: styles.style25,
    ),
  );
}
