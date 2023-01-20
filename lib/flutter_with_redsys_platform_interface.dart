import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_with_redsys_method_channel.dart';

abstract class FlutterWithRedsysPlatform extends PlatformInterface {
  /// Constructs a FlutterWithRedsysPlatform.
  FlutterWithRedsysPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterWithRedsysPlatform _instance = MethodChannelFlutterWithRedsys();

  /// The default instance of [FlutterWithRedsysPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterWithRedsys].
  static FlutterWithRedsysPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterWithRedsysPlatform] when
  /// they register themselves.
  static set instance(FlutterWithRedsysPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }
  Future<String?> webPayment(Map<String,dynamic> config) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
