import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FlutterCurrentLocale {
  static const MethodChannel _channel =
      const MethodChannel('flutter_current_locale');

  static Future<Locale> get currentLocale async {
    final List<String> locales =
        List<String>.from(await _channel.invokeMethod('current_locale'));
    try {
      if (locales.length == 2 || locales.length > 3) {
        return Locale(locales[0], locales[1]);
      } else if (locales.length == 3) {
        if (locales[2] == '' || locales[1] == '') {
          return Locale(locales[0], locales[2]);
        }

        return Locale.fromSubtags(
            languageCode: locales[0],
            scriptCode: locales[1],
            countryCode: locales[2]);
      }
    } catch (e) {
      return Locale('en', '');
    }

    return null;
  }
}
