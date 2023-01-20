

import 'package:flutter_with_redsys/common/ui_direct_payment_config.dart';

class TPVVConfiguration {
  String? license;
  String? fuc;
  String? terminal;
  String? packageName;
  String? environment = "1";
  String? currency;
  String? language;
  String? urlOK;
  String? urlKO;
  String? merchantUrl;
  String? merchantData;
  String? merchantName;
  String? titular;
  String? paymentMethods;
  String? paymentModule;
  String? accountType;
  String? prepaidCard;
  final String module = "PSis_Android";
  String? merchantDescriptor;
  String? partialPayment;
  String? sumTotal;
  String? shippingAddressPyp;
  String? taxReference;
  String? order;
  String? reference;
  double? amount;
  String? operationType;
  String? identifier;
  String? group;
  String? description;
  bool? enableResultAlert;
  String? resultAlertTextOk;
  String? resultAlertTextKo;
  String? resultAlertTextButtonOk;
  String? resultAlertTextButtonKo;
  String? resultAlertButtonColor;
  String? loadingScreenBackgroundColor;
  String? progressBarColor;
  bool? enableRedirection;
  UIDirectPaymentConfig? uiDirectPaymentConfig;
  String? extraParams;

  toJson() => {
        'order': order,
        'amount': amount,
        'fuc': fuc,
        'terminal': terminal,
        'license': license,
        'currency': currency,
        'reference': reference,
        'environment': environment,
        'paymentMethods': paymentMethods,
        'merchantUrl': merchantUrl,
        'merchantData': merchantData,
      };
}
