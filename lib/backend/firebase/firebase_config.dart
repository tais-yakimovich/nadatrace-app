import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCCgBnvNvotUQ8t0WAndORTSJ7e0peAX3Q",
            authDomain: "nadatrace-app.firebaseapp.com",
            projectId: "nadatrace-app",
            storageBucket: "nadatrace-app.firebasestorage.app",
            messagingSenderId: "1063719893468",
            appId: "1:1063719893468:web:cdb2d7c34423b77225b719",
            measurementId: "G-SF4BV1E3RX"));
  } else {
    await Firebase.initializeApp();
  }
}
