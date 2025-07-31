package com.sekizlipenguen.reactnativeappexit;

import android.app.Activity;
import android.content.Intent;
import android.os.Handler;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;

public class ReactNativeAppExitModule extends ReactContextBaseJavaModule {

    public static final String NAME = "ReactNativeAppExit";
    private final ReactApplicationContext reactContext;

    public ReactNativeAppExitModule(ReactApplicationContext reactContext) {
        super(reactContext);
        this.reactContext = reactContext;
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

    // Uygulama restart fonksiyonu
    @ReactMethod
    public void restartApp() {
        final Activity currentActivity = getCurrentActivity();
        if (currentActivity == null) return;

        // Ana aktiviteyi al
        Intent intent = currentActivity.getBaseContext()
                .getPackageManager()
                .getLaunchIntentForPackage(currentActivity.getBaseContext().getPackageName());

        if (intent != null) {
            // Intent'i tekrar başlangıç intent'i olarak ayarla
            intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
            // Önceki aktiviteleri temizle
            intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TASK);
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);

            // Kısa bir gecikme ile aktiviteyi yeniden başlat
            new Handler().postDelayed(() -> {
                currentActivity.startActivity(intent);
                currentActivity.finish();
                // Animasyonu devre dışı bırak
                android.os.Process.killProcess(android.os.Process.myPid());
            }, 100);
        }
    }
}
