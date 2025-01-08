import {exitApp as jsExitApp} from './index';

// TypeScript tip tanımlaması
export interface ReactNativeAppExitSpec {
    exitApp: () => void;
}

// JavaScript fonksiyonunu TypeScript'e sarıyoruz
export const exitApp: ReactNativeAppExitSpec['exitApp'] = jsExitApp;

export default {
    exitApp,
};
