package com.sekizlipenguen.reactnativeappexit;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;

public class ReactNativeAppExitModule extends ReactContextBaseJavaModule {

    public static final String NAME = "ReactNativeAppExit";

    public ReactNativeAppExitModule(ReactApplicationContext reactContext) {
        super(reactContext);
    }

    @Override
    public String getName() {
        return NAME;
    }

    // Uygulama kapatma fonksiyonu
    @ReactMethod
    public void exitApp() {
        // Android'de uygulamayı zorla kapatır
        System.exit(0);
    }
}
