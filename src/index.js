import {NativeModules} from 'react-native';

const {ReactNativeAppExit} = NativeModules;

if (!ReactNativeAppExit) {
  throw new Error(
      'ReactNativeAppExit native module is not linked. Make sure you have properly linked the native code.',
  );
}

// Uygulamayı kapatmak için fonksiyonu dışa aktar
export function exitApp() {
  ReactNativeAppExit.exitApp();
}

// Uygulamayı yeniden başlatmak için fonksiyonu dışa aktar
export function restartApp() {
  ReactNativeAppExit.restartApp();
}

export default {
  exitApp,
  restartApp,
};
