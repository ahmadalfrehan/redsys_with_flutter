import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:redsys_with_flutter/flutter_with_redsys_method_channel.dart';

void main() {
  MethodChannelFlutterWithRedsys platform = MethodChannelFlutterWithRedsys();
  const MethodChannel channel = MethodChannel('flutter_with_redsys');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  // test('getPlatformVersion', () async {
  //   expect(await platform.getPlatformVersion(), '42');
  // });
}
