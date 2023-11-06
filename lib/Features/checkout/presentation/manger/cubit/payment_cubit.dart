import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:payment_app/Features/checkout/data/models/payment_intent_input_model.dart';
import 'package:payment_app/Features/checkout/data/models/repos/checkout_repo.dart';
// ignore: unused_import
import 'dart:developer';
part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this.checkoutRepo) : super(PaymentInitial());
  final CheckoutRepo checkoutRepo;

  Future makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    emit(PaymentLoading());
    var data = await checkoutRepo.makePayment(
        paymentIntentInputModel: paymentIntentInputModel);
    data.fold(
      (l) => emit(PaymentFailure(l.errMessage)),
      (r) => emit(PaymentSuccess()),
    );
  }

  @override
  void onChange(Change<PaymentState> change) {
    log(change.toString()); // Log the Change object as a String
    super.onChange(change);
  }
}
