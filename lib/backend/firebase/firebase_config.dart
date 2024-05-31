import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyC18CV4LF_wFccoh-HbF51VsVfuM-pMwCw",
            authDomain: "edu-sphere-v72qko.firebaseapp.com",
            projectId: "edu-sphere-v72qko",
            storageBucket: "edu-sphere-v72qko.appspot.com",
            messagingSenderId: "23830100606",
            appId: "1:23830100606:web:7114aa2ee6c60c6136762f"));
  } else {
    await Firebase.initializeApp();
  }
}
