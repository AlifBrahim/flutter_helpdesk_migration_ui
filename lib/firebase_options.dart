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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCWUAtoMkcct9ex2_2Dgu6Er-mUeZ2zfC0',
    appId: '1:918004869613:android:a21deefc9f9616ae38dfe4',
    messagingSenderId: '918004869613',
    projectId: 'sigmahelpdesk-32f5a',
    storageBucket: 'sigmahelpdesk-32f5a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDGljyzfatS8dCNcnx1F-1ohP1znpHXU6c',
    appId: '1:918004869613:ios:1c7ca4d41b0a8d8a38dfe4',
    messagingSenderId: '918004869613',
    projectId: 'sigmahelpdesk-32f5a',
    storageBucket: 'sigmahelpdesk-32f5a.appspot.com',
    androidClientId: '918004869613-pkopivkc7crioahiv7tigt2getlvg028.apps.googleusercontent.com',
    iosClientId: '918004869613-15aqisitn7dkib3rjmti0a4r27pgu6rc.apps.googleusercontent.com',
    iosBundleId: 'com.arkayapps.sigmahelpdesk',
  );
}
