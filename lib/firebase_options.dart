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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAoRrd1XqFDzGESHNDjfkBuRCQo863B4_Y',
    appId: '1:1054081298230:web:622fc85de8d472d5a88d97',
    messagingSenderId: '1054081298230',
    projectId: 'mobile-project-c0338',
    authDomain: 'mobile-project-c0338.firebaseapp.com',
    storageBucket: 'mobile-project-c0338.appspot.com',
    measurementId: 'G-6JEKQ9NLNW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyARWHcEiXikz3VT_9mIb4jfFyRVhNe8bE0',
    appId: '1:1054081298230:android:2a8454d049334f7fa88d97',
    messagingSenderId: '1054081298230',
    projectId: 'mobile-project-c0338',
    storageBucket: 'mobile-project-c0338.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBzyn9CNZo2P8RzEmtXIj7zEP87K2vjxU8',
    appId: '1:1054081298230:ios:17c7da08c846493ca88d97',
    messagingSenderId: '1054081298230',
    projectId: 'mobile-project-c0338',
    storageBucket: 'mobile-project-c0338.appspot.com',
    iosClientId: '1054081298230-vh7tu52a935hs2ab4es6chj0cqvuhdk6.apps.googleusercontent.com',
    iosBundleId: 'com.example.mobileProject',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAoRrd1XqFDzGESHNDjfkBuRCQo863B4_Y',
    appId: '1:1054081298230:web:8982d891096d9cfda88d97',
    messagingSenderId: '1054081298230',
    projectId: 'mobile-project-c0338',
    authDomain: 'mobile-project-c0338.firebaseapp.com',
    storageBucket: 'mobile-project-c0338.appspot.com',
    measurementId: 'G-LCXQ7VW26W',
  );

}