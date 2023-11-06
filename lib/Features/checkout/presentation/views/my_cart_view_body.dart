// ignore_for_file: unused_import, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/Features/checkout/data/models/repos/checkout_repo_impl.dart';
import 'package:payment_app/Features/checkout/presentation/manger/cubit/payment_cubit.dart';
import 'package:payment_app/Features/checkout/presentation/payment_method_list_view.dart';
import 'package:payment_app/Features/checkout/presentation/views/payment_details.dart';
// ignore: unused_import
import 'package:payment_app/core/utils/styles.dart';
import 'package:payment_app/widgets/cart_info_item.dart';
import 'package:payment_app/widgets/custom_button.dart';
import 'package:payment_app/widgets/payment_method_button_sheet.dart';
import 'package:payment_app/widgets/total_price.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 18,
          ),
          Expanded(child: Image.asset('assets/images/baskt image.png')),
          const SizedBox(
            height: 25,
          ),
          const OrderInfoItem(
            title: 'Order Subtotal',
            value: r'42.97$',
          ),
          const SizedBox(
            height: 3,
          ),
          const OrderInfoItem(
            title: 'Discount',
            value: r'0$',
          ),
          const SizedBox(
            height: 3,
          ),
          const OrderInfoItem(
            title: 'Shipping',
            value: r'8$',
          ),
          const Divider(
            height: 34,
            thickness: 2,
            color: Color(0xFFC6C6C6),
          ),
          const TotalPrice(
            title: 'Total',
            value: r'50.97$',
          ),
          const SizedBox(
            height: 17,
          ),
          CustomButton(
            text: 'Complete Payment',
            onTap: () {
              //
              showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                    16,
                  )),
                  context: context,
                  builder: (context) {
                    return BlocProvider(
                      create: (context) => PaymentCubit(CheckoutRepoImpl()),
                      child: const PaymentMethodButtonSheet(),
                    );
                  });
            },
          ),
          const SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }
}
