#import "ReactNativeAppExit.h"

@implementation ReactNativeAppExit

// React Native modülünün tanımlaması
RCT_EXPORT_MODULE();

// Uygulama çıkış fonksiyonu
RCT_EXPORT_METHOD(exitApp) {
exit(0);
}

@end
