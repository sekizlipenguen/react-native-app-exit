#import <React/RCTBridgeModule.h>

@interface ReactNativeAppExit : NSObject <RCTBridgeModule>
@property (nonatomic, weak) RCTBridge *bridge;
@end
