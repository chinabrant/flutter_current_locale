import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_current_locale/flutter_current_locale.dart';

void main() {
  const MethodChannel channel = MethodChannel('flutter_current_locale');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    // expect(await FlutterCurrentLocale.platformVersion, '42');
  });
}
