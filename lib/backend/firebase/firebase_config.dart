import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBDfDlByh49efoZPby2Wn0KY51jkAGnsjU",
            authDomain: "poc-icommon-b01ka9.firebaseapp.com",
            projectId: "poc-icommon-b01ka9",
            storageBucket: "poc-icommon-b01ka9.firebasestorage.app",
            messagingSenderId: "999979333152",
            appId: "1:999979333152:web:d124bb396076db37186e45",
            measurementId: "G-XFSPZPLYPH"));
  } else {
    await Firebase.initializeApp();
  }
}
