#import "FlutterEmayLoginPlugin.h"
#import "MobileAuth.h"

@implementation FlutterEmayLoginPlugin{
    FlutterResult _result;
    UIViewController *_viewController;
}

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"flutter_emay_login"
            binaryMessenger:[registrar messenger]];
  UIViewController *viewController = [UIApplication sharedApplication].delegate.window.rootViewController;
  FlutterEmayLoginPlugin* instance = [[FlutterEmayLoginPlugin alloc] initWithViewController:viewController];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (instancetype)initWithViewController:(UIViewController *)viewController {
  self = [super init];
  if (self) {
    _viewController = viewController;
  }
  return self;
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  }else if ([@"displayLogin" isEqualToString:call.method]) {
       NSDictionary *paramDict = call.arguments;
       [MobileAuth displayLogin:_viewController modeParam:paramDict result:result];
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
