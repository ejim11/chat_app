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
    apiKey: 'AIzaSyCibRGPLD65L4VlTWinQB_klbxutgbEBGE',
    appId: '1:254059881611:web:890a84269cb2b3cb73e08e',
    messagingSenderId: '254059881611',
    projectId: 'flutter-chat-app-82de4',
    authDomain: 'flutter-chat-app-82de4.firebaseapp.com',
    storageBucket: 'flutter-chat-app-82de4.appspot.com',
    measurementId: 'G-2JZYQEREPP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBIx0pZwze-jmE13XibiSTWMkr1pQ9IAFM',
    appId: '1:254059881611:android:80f8011e200a01db73e08e',
    messagingSenderId: '254059881611',
    projectId: 'flutter-chat-app-82de4',
    storageBucket: 'flutter-chat-app-82de4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCByyhFRktY1LGmiRvtwqNe-wya1HNGXxw',
    appId: '1:254059881611:ios:420caef92127cd9273e08e',
    messagingSenderId: '254059881611',
    projectId: 'flutter-chat-app-82de4',
    storageBucket: 'flutter-chat-app-82de4.appspot.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCByyhFRktY1LGmiRvtwqNe-wya1HNGXxw',
    appId: '1:254059881611:ios:420caef92127cd9273e08e',
    messagingSenderId: '254059881611',
    projectId: 'flutter-chat-app-82de4',
    storageBucket: 'flutter-chat-app-82de4.appspot.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCibRGPLD65L4VlTWinQB_klbxutgbEBGE',
    appId: '1:254059881611:web:2b7ed2397f7f84b573e08e',
    messagingSenderId: '254059881611',
    projectId: 'flutter-chat-app-82de4',
    authDomain: 'flutter-chat-app-82de4.firebaseapp.com',
    storageBucket: 'flutter-chat-app-82de4.appspot.com',
    measurementId: 'G-8K98BR79VC',
  );
}
