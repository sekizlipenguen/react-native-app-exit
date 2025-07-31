#import "ReactNativeAppExit.h"
#import <React/RCTBridge.h>
#import <React/RCTBundleURLProvider.h>

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
    dispatch_async(dispatch_get_main_queue(), ^{
        // Birden fazla yöntemi aynı anda kullanarak restart işleminin başarılı olma olasılığını artırıyoruz

        // 1. Yöntem: RCTTriggerReloadCommandNotification bildirimi gönderme
        [[NSNotificationCenter defaultCenter] postNotificationName:@"RCTTriggerReloadCommandNotification" object:nil];

        // 2. Yöntem: RCTReloadNotification bildirimi gönderme
        [[NSNotificationCenter defaultCenter] postNotificationName:@"RCTReloadNotification" object:nil];

        // 3. Yöntem: Bridge yeniden yükleme (eğer bridge varsa)
        if (self.bridge) {
            [self.bridge reload];
        }

        // 4. Yöntem: Uygulama delegesinin root view controller'ını yeniden yükleme
        UIApplication *application = [UIApplication sharedApplication];
        UIWindow *window = application.keyWindow;
        if (window) {
            UIViewController *rootViewController = window.rootViewController;
            if (rootViewController) {
                [rootViewController.view removeFromSuperview];
                window.rootViewController = nil;
                window.rootViewController = rootViewController;
            }
        }
    });
}

@end
