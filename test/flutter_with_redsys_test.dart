import 'package:flutter_test/flutter_test.dart';

import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:redsys_with_flutter/flutter_with_redsys.dart';
import 'package:redsys_with_flutter/flutter_with_redsys_method_channel.dart';
import 'package:redsys_with_flutter/flutter_with_redsys_platform_interface.dart';

class MockFlutterWithRedsysPlatform
    with MockPlatformInterfaceMixin
    implements FlutterWithRedsysPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<String?> webPayment(Map<String, dynamic> config) {
    // TODO: implement webPayment
    throw UnimplementedError();
  }
}

void main() {
  final FlutterWithRedsysPlatform initialPlatform = FlutterWithRedsysPlatform.instance;

  test('$MethodChannelFlutterWithRedsys is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterWithRedsys>());
  });

  test('getPlatformVersion', () async {
    FlutterWithRedsys flutterWithRedsysPlugin = FlutterWithRedsys();
    MockFlutterWithRedsysPlatform fakePlatform = MockFlutterWithRedsysPlatform();
    FlutterWithRedsysPlatform.instance = fakePlatform;

    expect(await flutterWithRedsysPlugin.webPayment({}), '42');
  });
}
