# Redsys with Flutter

Redsys with Flutter is a Flutter plugin package that provides integration with the Redsys bank payment gateway. This package allows you to easily process payments within your Flutter applications using Redsys.

## Features
Seamless integration with Redsys payment gateway.
Easy configuration and setup.
Supports both iOS and Android platforms.
Provides callbacks for transaction success, failure, and cancellation.
Comprehensive documentation and examples   
This project is a starting point for a Flutter

If you encounter any issues with the package or would like to contribute to its development, please
open an issue or submit a pull request on the
[github repo](https://github.com/ahmadalfrehan/redsys_with_flutter).

## Installation

To use Redsys with Flutter, follow these steps:

Add the dependency to your 'pubspec.yaml' file:

``` dependencies:
redsys_with_flutter: ^1.0.0
```

Or run the following command :

```
flutter pub add redsys_with_flutter
```

Run flutter pub get to fetch the package

# Usage

## Import the package

```
import 'package:redsys_with_flutter/common/ui_direct_payment_config.dart';
import 'package:redsys_with_flutter/flutter_with_redsys.dart';
import 'package:redsys_with_flutter/common/tpvv_configuration.dart';
import 'package:redsys_with_flutter/common/tpvv_constants.dart';

```

## Configure Redsys settings

```
RedsysWithFlutter.configure(
merchantCode: 'YOUR_MERCHANT_CODE',
terminal: 'YOUR_TERMINAL',
currency: 'YOUR_CURRENCY',
secretKey: 'YOUR_SECRET_KEY',
transactionType: TransactionType.authorization,
urlEnvironment: UrlEnvironment.live,
);
```

## Process a payment

```
  final _pluginRedsysPlugin = FlutterWithRedsys();

  performCardPayment(context, {String? alias, String? originalAlias}) async {
    TPVVConfiguration tpvvConfig = TPVVConfiguration();
    tpvvConfig.amount = 10.0;
    tpvvConfig.enableRedirection = true;
    tpvvConfig.enableResultAlert = true;
    tpvvConfig.paymentMethods = TPVVConstants.PAYMENT_METHOD_T;
    tpvvConfig.license = "<dev_license_for_ios_or_android>";
    tpvvConfig.environment = TPVVConstants.ENVIRONMENT_TEST;
    tpvvConfig.fuc = "<merchant_fuc>";
    //TPVVConfiguration.setLicense("3Xe1uoMGqqFPSrsqK4xo");
    tpvvConfig.environment = '3';
    tpvvConfig.terminal = "002";
    tpvvConfig.merchantUrl = "<merchant_url_for_results_reporting>";
    tpvvConfig.currency = "978";
    tpvvConfig.order = "978";
    tpvvConfig.reference = 'ahmad';
    tpvvConfig.enableResultAlert = true;
    tpvvConfig.enableRedirection= true;
    tpvvConfig.uiDirectPaymentConfig= UIDirectPaymentConfig(
    );
    tpvvConfig.merchantData = "<id_transaction_to_be_set>";
     log(tpvvConfig.toJson().toString());
    var call = await _pluginRedsysPlugin.webPayment(tpvvConfig.toJson());
    log(call.toString());
    var resp = jsonDecode(call.toString());
  }

```

# Documentation

For detailed documentation and usage examples, please refer to
the [Redsys with Flutter documentation.](https://ahmadalfrehan.com/articles)

# License

Redsys with Flutter is released under the [Apache License](http://www.apache.org/licenses/LICENSE-2.0).

# Issues and Contributions

If you encounter any issues with the package or would like to contribute to its development, please
open an issue or submit a pull request on
the [GitHub repository](https://github.com/ahmadalfrehan/redsys_with_flutter).

# Credits

Redsys with Flutter is developed and maintained by [Ahmad Alfrehan](https://ahmadalfrehan.com).
Special thanks to the Flutter community for their contributions and support.
