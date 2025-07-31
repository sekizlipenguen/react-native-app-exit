#import "ReactNativeAppExit.h"
#import <React/RCTBridge.h>

@implementation ReactNativeAppExit

// React Native modülünün tanımlaması
RCT_EXPORT_MODULE();

@synthesize bridge = _bridge;

// Uygulama çıkış fonksiyonu
RCT_EXPORT_METHOD(exitApp) {
exit(0);
}

// Uygulama restart fonksiyonu
RCT_EXPORT_METHOD(restartApp) {
    // Bridge'i yeniden yükleyerek uygulamayı yeniden başlatıyoruz
    dispatch_async(dispatch_get_main_queue(), ^{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"RCTReloadNotification" object:nil];
    });
}

@end
