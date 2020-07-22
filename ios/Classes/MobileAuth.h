#import <Flutter/Flutter.h>

@interface MobileAuth : NSObject
+ (void) displayLogin:(UIViewController *)vc modeParam:(NSDictionary*)modeParam result:(FlutterResult)result;
@end
