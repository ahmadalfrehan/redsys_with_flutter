import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_with_redsys_platform_interface.dart';

/// An implementation of [FlutterWithRedsysPlatform] that uses method channels.
class MethodChannelFlutterWithRedsys extends FlutterWithRedsysPlatform {
  /// The method channel used to interact with the native platform.

  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_with_redsys');


  @override
  Future<String?> webPayment(Map<String,dynamic> config) async {
    final result = await methodChannel.invokeMethod<String>('webPayment',config);
    return result;
  }
}
