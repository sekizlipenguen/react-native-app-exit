import {exitApp as jsExitApp, restartApp as jsRestartApp} from './index';

// TypeScript tip tanımlaması
export interface ReactNativeAppExitSpec {
    exitApp: () => void;
    restartApp: () => void;
}

// JavaScript fonksiyonlarını TypeScript'e sarıyoruz
export const exitApp: ReactNativeAppExitSpec['exitApp'] = jsExitApp;
export const restartApp: ReactNativeAppExitSpec['restartApp'] = jsRestartApp;

export default {
    exitApp,
    restartApp,
};
