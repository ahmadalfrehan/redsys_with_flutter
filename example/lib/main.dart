import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:redsys_with_flutter/common/ui_direct_payment_config.dart';
import 'package:redsys_with_flutter/flutter_with_redsys.dart';
import 'package:redsys_with_flutter/common/tpvv_configuration.dart';
import 'package:redsys_with_flutter/common/tpvv_constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  final _flutterWithRedsysPlugin = FlutterWithRedsys();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  // Future<void> initPlatformState() async {
  //   String platformVersion;
  //   // Platform messages may fail, so we use a try/catch PlatformException.
  //   // We also handle the message potentially returning null.
  //   try {
  //     platformVersion =
  //         await _flutterWithRedsysPlugin.webPayment(tpvvConfig) ?? 'Unknown platform version';
  //   } on PlatformException {
  //     platformVersion = 'Failed to get platform version.';
  //   }
  //
  //   // If the widget was removed from the tree while the asynchronous platform
  //   // message was in flight, we want to discard the reply rather than calling
  //   // setState to update our non-existent appearance.
  //   if (!mounted) return;
  //
  //   setState(() {
  //     _platformVersion = platformVersion;
  //   });
  // }
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      TPVVConfiguration tpvvConfig = TPVVConfiguration();

      tpvvConfig.amount = 10.0;
      tpvvConfig.paymentMethods = TPVVConstants.PAYMENT_METHOD_T;
      tpvvConfig.license = "<dev_license_for_ios_or_android>";
      tpvvConfig.environment = TPVVConstants.ENVIRONMENT_TEST;
      tpvvConfig.fuc = "<merchant_fuc>";
      //TPVVConfiguration.setLicense("3Xe1uoMGqqFPSrsqK4xo");
      tpvvConfig.terminal = "002";
      tpvvConfig.merchantUrl = "<merchant_url_for_results_reporting>";
      tpvvConfig.currency = "978";
      tpvvConfig.merchantData = "<id_transaction_to_be_set>";

      var call = _flutterWithRedsysPlugin.webPayment(tpvvConfig.toJson());
      log("CALL $call");
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;
  }

  final _pluginRedsysPlugin = FlutterWithRedsys();

  performCardPayment(context, {String? alias, String? originalAlias}) async {
  //  _isLoading.value = true;
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
    log('ressssppp$resp');
   // _isLoading.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: TextButton(child: Text('Running on: $_platformVersion\n'),onPressed: (){
            // initPlatformState();
            performCardPayment(context);
          }),
        ),
      ),
    );
  }
}
