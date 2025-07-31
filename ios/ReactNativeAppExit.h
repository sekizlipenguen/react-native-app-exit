#import <React/RCTBridgeModule.h>
#import <UIKit/UIKit.h>

@interface ReactNativeAppExit : NSObject <RCTBridgeModule>
@property (nonatomic, weak) RCTBridge *bridge;
@end
