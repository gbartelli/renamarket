import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBQp6-463GvJV_5Z_ijS4pqH7gZtDYIoiQ",
            authDomain: "renamarket2teste.firebaseapp.com",
            projectId: "renamarket2teste",
            storageBucket: "renamarket2teste.appspot.com",
            messagingSenderId: "946843573199",
            appId: "1:946843573199:web:c7162c1c9d920ed75710ba",
            measurementId: "G-FZ1WHZSLWJ"));
  } else {
    await Firebase.initializeApp();
  }
}
