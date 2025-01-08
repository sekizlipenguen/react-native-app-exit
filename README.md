# @sekizlipenguen/react-native-app-exit

A lightweight React Native module to programmatically exit the application. Compatible with React Native 0.60 and above.

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
import {NativeModules} from 'react-native';

const {ReactNativeAppExit} = NativeModules;
```

### Exit the Application

Call the `exitApp` method to programmatically close the app:

```javascript
ReactNativeAppExit.exitApp();
```

#### Example:

```javascript
import React from 'react';
import {Button, View, Alert} from 'react-native';
import {NativeModules} from 'react-native';

const {ReactNativeAppExit} = NativeModules;

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

  return (
      <View style={{flex: 1, justifyContent: 'center', alignItems: 'center'}}>
        <Button title="Exit App" onPress={handleExitApp}/>
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

- On iOS, force-closing the app programmatically is not recommended by Apple, but this module implements a similar approach. Use it cautiously.

---

## Contribution

Contributions are welcome! Please feel free to submit a pull request or file an issue in the [GitHub repository](https://github.com/sekizlipenguen/react-native-app-exit).

---

## License

This project is licensed under the [MIT License](LICENSE).

