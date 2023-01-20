
import 'flutter_with_redsys_platform_interface.dart';

class FlutterWithRedsys {
  Future<String?> webPayment(Map<String,dynamic> tpvvConfig) {
    return FlutterWithRedsysPlatform.instance.webPayment(tpvvConfig);
  }
}
