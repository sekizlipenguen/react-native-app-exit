![platforms](https://img.shields.io/badge/platforms-Android%20%7C%20iOS-brightgreen.svg?style=flat-square&colorB=191A17)
[![npm](https://img.shields.io/npm/v/@sekizlipenguen/react-native-app-exit.svg?style=flat-square)](https://www.npmjs.com/package/@sekizlipenguen/react-native-app-exit)
[![npm](https://img.shields.io/npm/dm/@sekizlipenguen/react-native-app-exit.svg?style=flat-square&colorB=007ec6)](https://www.npmjs.com/package/@sekizlipenguen/react-native-app-exit)

# @sekizlipenguen/react-native-app-exit

A lightweight React Native module to programmatically exit or restart the application. Compatible with React Native 0.60 and above.

---

## Installation

Using npm:

```bash
npm install @sekizlipenguen/react-native-app-exit
```

Using yarn:

```bash
yarn add @sekizlipenguen/react-native-app-exit
```

### iOS Setup

After installing the package, make sure to run the following command to link the native iOS module:

```bash
npx pod-install
```

### Android Setup

No additional setup is required for Android. The module will automatically link when you build your app.

---

## Compatibility

- **React Native**: `>=0.60`
- **iOS**: Supported
- **Android**: Supported
- **JavaScript and TypeScript**: Fully supported

---

## Usage

### Import the Module

```javascript
import ReactNativeAppExit from '@sekizlipenguen/react-native-app-exit';
```

### Exit the Application

Call the `exitApp` method to programmatically close the app:

```javascript
ReactNativeAppExit.exitApp();
```

### Restart the Application

Call the `restartApp` method to programmatically restart the app:

```javascript
ReactNativeAppExit.restartApp();
```

#### Example:

```javascript
import React from 'react';
import {Button, View, Alert} from 'react-native';
import ReactNativeAppExit from '@sekizlipenguen/react-native-app-exit';

const App = () => {
  const handleExitApp = () => {
    Alert.alert(
        'Exit App',
        'Are you sure you want to close the application?',
        [
          {text: 'Cancel', style: 'cancel'},
          {text: 'Yes', onPress: () => ReactNativeAppExit.exitApp()},
        ]
    );
  };

  const handleRestartApp = () => {
    Alert.alert(
        'Restart App',
        'Are you sure you want to restart the application?',
        [
          {text: 'Cancel', style: 'cancel'},
          {text: 'Yes', onPress: () => ReactNativeAppExit.restartApp()},
        ]
    );
  };

  return (
      <View style={{flex: 1, justifyContent: 'center', alignItems: 'center'}}>
        <Button title="Exit App" onPress={handleExitApp}/>
        <Button title="Restart App" onPress={handleRestartApp}/>
      </View>
  );
};

export default App;
```

---

## Platform-Specific Details

### Android
- On Android, this module uses `System.exit(0)` to force the application to close.

### iOS

- On iOS, force-closing the app programmatically is not recommended by Apple. This module provides a similar functionality, but it is advised to implement a confirmation alert before using this feature to ensure a better user experience.

---

## Contribution

Contributions are welcome! Please feel free to submit a pull request or file an issue in the [GitHub repository](https://github.com/sekizlipenguen/react-native-app-exit).

---

## License

This project is licensed under the [MIT License](LICENSE).

