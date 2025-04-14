import '/flutter_flow/flutter_flow_credit_card_form.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'paymentinfo_widget.dart' show PaymentinfoWidget;
import 'package:flutter/material.dart';

class PaymentinfoModel extends FlutterFlowModel<PaymentinfoWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for CreditCardForm widget.
  final creditCardFormKey = GlobalKey<FormState>();
  CreditCardModel creditCardInfo = emptyCreditCard();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
