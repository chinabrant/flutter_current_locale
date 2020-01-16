#import "FlutterCurrentLocalePlugin.h"
#if __has_include(<flutter_current_locale/flutter_current_locale-Swift.h>)
#import <flutter_current_locale/flutter_current_locale-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_current_locale-Swift.h"
#endif

@implementation FlutterCurrentLocalePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterCurrentLocalePlugin registerWithRegistrar:registrar];
}
@end
