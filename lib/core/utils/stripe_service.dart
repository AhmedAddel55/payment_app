// ignore: unused_import
import 'dart:ffi';

// ignore: unused_import
import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_app/Features/checkout/data/models/payment_intent_input_model.dart';
import 'package:payment_app/Features/checkout/data/models/payment_intint_model/payment_intint_model.dart';
import 'package:payment_app/core/utils/api_keys.dart';
import 'package:payment_app/core/utils/api_service.dart';
// ignore: duplicate_import
import 'package:payment_app/Features/checkout/data/models/payment_intent_input_model.dart';

class StripeService {
  final ApiServuce apiServuce = ApiServuce();
  Future<PaymentIntintModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    var response = await apiServuce.post(
      body: paymentIntentInputModel.toJson(),
      contentType: Headers.formUrlEncodedContentType,
      url: 'https://api.stripe.com/v1/payment_intents',
      token: ApiKeys.secretKey,
    );
    // ignore: unused_local_variable
    var paymentIntentModel = PaymentIntintModel.fromJson(response.data);
    return paymentIntentModel;
  }

  Future initPaymentSheet({required String paymentIntentClientSecret}) async {
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
      paymentIntentClientSecret: paymentIntentClientSecret,
      merchantDisplayName: 'Ahmed Adel',
    ));
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePaymemt({required paymentIntentInputModel}) async {
    // ignore: unused_local_variable
    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);
    await initPaymentSheet(
        paymentIntentClientSecret: PaymentIntintModel().clientSecret!);
    await displayPaymentSheet();
  }

  Future<PaymentIntintModel> createCustomer(
      PaymentIntentInputModel paymentIntentInputModel) async {
    var response = await apiServuce.post(
      body: paymentIntentInputModel.toJson(),
      contentType: Headers.formUrlEncodedContentType,
      url: 'https://api.stripe.com/v1/customers',
      token: ApiKeys.secretKey,
    );
    // ignore: unused_local_variable
    var paymentIntentModel = PaymentIntintModel.fromJson(response.data);
    return paymentIntentModel;
  }
}
