package com.hellotalk.flutter_current_locale

import androidx.annotation.NonNull;
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar
import java.util.*

/** FlutterCurrentLocalePlugin */
public class FlutterCurrentLocalePlugin: FlutterPlugin, MethodCallHandler {
  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    val channel = MethodChannel(flutterPluginBinding.getFlutterEngine().getDartExecutor(), "flutter_current_locale")
    channel.setMethodCallHandler(FlutterCurrentLocalePlugin());
  }

  // This static function is optional and equivalent to onAttachedToEngine. It supports the old
  // pre-Flutter-1.12 Android projects. You are encouraged to continue supporting
  // plugin registration via this function while apps migrate to use the new Android APIs
  // post-flutter-1.12 via https://flutter.dev/go/android-project-migration.
  //
  // It is encouraged to share logic between onAttachedToEngine and registerWith to keep
  // them functionally equivalent. Only one of onAttachedToEngine or registerWith will be called
  // depending on the user's project. onAttachedToEngine or registerWith must both be defined
  // in the same class.
  companion object {
    @JvmStatic
    fun registerWith(registrar: Registrar) {
      val channel = MethodChannel(registrar.messenger(), "flutter_current_locale")
      channel.setMethodCallHandler(FlutterCurrentLocalePlugin())
    }
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    if (call.method == "current_locale") {
      val locale = Locale.getDefault()
      var list = ArrayList<String>()
      list.add(locale.language);
      if (locale.script != null) {
        list.add(locale.script)
      }

      if (locale.country != null) {
        list.add(locale.country)
      }

      result.success(list)
    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
  }
}
