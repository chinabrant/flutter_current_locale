import Flutter
import UIKit

public class SwiftFlutterCurrentLocalePlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_current_locale", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterCurrentLocalePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if call.method == "current_locale" {
        let locale = NSLocale.preferredLanguages[0]
        let results = locale.split(separator: "-")
        result(results)
    } else {
        result(nil)
    }
  }
}
