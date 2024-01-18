// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBH1KuIijj5o0EYsrSpBw0yS2pRI6D-SBA',
    appId: '1:613669925727:web:e60ff2ca1edd61c9a4fcea',
    messagingSenderId: '613669925727',
    projectId: 'whatsapp-25d12',
    authDomain: 'whatsapp-25d12.firebaseapp.com',
    storageBucket: 'whatsapp-25d12.appspot.com',
    measurementId: 'G-ZVR27VYFH1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAQyjDDnKHU_bminW5SsDFq0V70qiQ42b8',
    appId: '1:613669925727:android:263644c34d608feaa4fcea',
    messagingSenderId: '613669925727',
    projectId: 'whatsapp-25d12',
    storageBucket: 'whatsapp-25d12.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB11LEDR71TDwpTmqmrUVFpQbsZAZP_iug',
    appId: '1:613669925727:ios:330b73ae08e4de2ea4fcea',
    messagingSenderId: '613669925727',
    projectId: 'whatsapp-25d12',
    storageBucket: 'whatsapp-25d12.appspot.com',
    iosBundleId: 'com.example.whatsapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB11LEDR71TDwpTmqmrUVFpQbsZAZP_iug',
    appId: '1:613669925727:ios:537fe72d2da09e82a4fcea',
    messagingSenderId: '613669925727',
    projectId: 'whatsapp-25d12',
    storageBucket: 'whatsapp-25d12.appspot.com',
    iosBundleId: 'com.example.whatsapp.RunnerTests',
  );
}
