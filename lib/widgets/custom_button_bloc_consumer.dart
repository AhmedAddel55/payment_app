import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:payment_app/Features/checkout/data/models/amount_model/amount_model.dart';
import 'package:payment_app/Features/checkout/data/models/amount_model/details.dart';
import 'package:payment_app/Features/checkout/data/models/item_list_model/item.dart';
import 'package:payment_app/Features/checkout/data/models/item_list_model/item_list_model.dart';
// ignore: unused_import
import 'package:payment_app/Features/checkout/data/models/payment_intent_input_model.dart';
import 'package:payment_app/Features/checkout/presentation/manger/cubit/payment_cubit.dart';

// ignore: duplicate_import
import 'package:payment_app/Features/checkout/presentation/manger/cubit/payment_cubit.dart';
import 'package:payment_app/Features/checkout/presentation/thank_you_view.dart';
import 'package:payment_app/core/utils/api_keys.dart';
import 'package:payment_app/widgets/custom_button.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) {
                return const ThankYouView();
              },
            ),
          );
        }
        if (state is PaymentFailure) {
          Navigator.pop(context);
          SnackBar snackBar = SnackBar(
            content: Text(state.errMessage),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        return CustomButton(
            onTap: () {
              // PaymentIntentInputModel paymentIntentInputModel =
              //     PaymentIntentInputModel(
              //   amount: '100',
              //   currency: 'USD',
              //   customerId: 'cus_Owf6ZlpqlEsfey'
              // );
              // await BlocProvider.of<PaymentCubit>(context).makePayment(
              //   paymentIntentInputModel: paymentIntentInputModel,
              // );
              var transctionData = getTransctionsData();
              exceutePaypalPayment(context, transctionData);
            },
            isLoading: state is PaymentLoading ? true : false,
            text: 'Continue');
      },
    );
  }

  void exceutePaypalPayment(BuildContext context,
      ({AmountModel amount, ItemListModel itemList}) transctionData) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: ApiKeys.clientID,
        secretKey: ApiKeys.secretKeyPaypal,
        transactions: [
          {
            "amount": transctionData.amount.toJson(),
            "description": "The payment transaction description.",
            // "payment_options": {
            //   "allowed_payment_method":
            //       "INSTANT_FUNDING_SOURCE"
            // },
            "item_list": transctionData.itemList.toJson(),
          }
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          log("onSuccess: $params");
          Navigator.pop(context);
        },
        onError: (error) {
          log("onError: $error");
          Navigator.pop(context);
        },
        onCancel: () {
          print('cancelled:');
          Navigator.pop(context);
        },
      ),
    ));
  }

  ({AmountModel amount, ItemListModel itemList}) getTransctionsData() {
    var amount = AmountModel(
        currency: 'USD',
        total: "100",
        details: Details(
          shipping: "0",
          subtotal: "100",
          shippingDiscount: 0,
        ));

    List<OrderItemModel> orders = [
      OrderItemModel(
        currency: 'USD',
        name: 'Apple',
        price: "4",
        quantity: 10,
      ),
      OrderItemModel(
        currency: 'USD',
        name: 'Apple',
        price: "5",
        quantity: 12,
      ),
    ];
    var itemList = ItemListModel(
      orders: orders,
    );
    return (
      amount: amount,
      itemList: itemList,
    );
  }
}
