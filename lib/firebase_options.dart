// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAGWGJbjz42NU1YjuasNej-2fBdBxScM7I',
    appId: '1:506762279253:web:bce7a3b00d8640147f57dc',
    messagingSenderId: '506762279253',
    projectId: 'contactapp-ff0ab',
    authDomain: 'contactapp-ff0ab.firebaseapp.com',
    storageBucket: 'contactapp-ff0ab.appspot.com',
    measurementId: 'G-PHMQ534MP9',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAJajQBxJ0a62gqS-oiIo7FSL3_3eYDJf0',
    appId: '1:506762279253:android:8297e2fd172426287f57dc',
    messagingSenderId: '506762279253',
    projectId: 'contactapp-ff0ab',
    storageBucket: 'contactapp-ff0ab.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDY7CXcVEMKNHEYrvk6L1VrMz37Sv7ZP0o',
    appId: '1:506762279253:ios:6b42d32cb0b274c07f57dc',
    messagingSenderId: '506762279253',
    projectId: 'contactapp-ff0ab',
    storageBucket: 'contactapp-ff0ab.appspot.com',
    iosBundleId: 'com.example.contactFormApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDY7CXcVEMKNHEYrvk6L1VrMz37Sv7ZP0o',
    appId: '1:506762279253:ios:6b42d32cb0b274c07f57dc',
    messagingSenderId: '506762279253',
    projectId: 'contactapp-ff0ab',
    storageBucket: 'contactapp-ff0ab.appspot.com',
    iosBundleId: 'com.example.contactFormApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAGWGJbjz42NU1YjuasNej-2fBdBxScM7I',
    appId: '1:506762279253:web:a343ecface0875d67f57dc',
    messagingSenderId: '506762279253',
    projectId: 'contactapp-ff0ab',
    authDomain: 'contactapp-ff0ab.firebaseapp.com',
    storageBucket: 'contactapp-ff0ab.appspot.com',
    measurementId: 'G-512DTP1GHG',
  );
}
