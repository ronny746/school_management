import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';


import '../auth/register.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCj3dBOhXkjD-uzG9c8cx1Zoy5PfmZvfWI",
            authDomain: "school-2c880.firebaseapp.com",
            projectId: "school-2c880",
            storageBucket: "school-2c880.appspot.com",
            messagingSenderId: "241472026302",
            appId: "1:241472026302:web:c28f638a4738fc70b290ef",
            measurementId: "G-B0S9LR712H"));
  } else {
    await Firebase.initializeApp();
  }
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue[900],
      ),
      home:  Splash2(),
    );
  }
}
class Splash2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 6,
      navigateAfterSeconds: new Register(),
     image: Image.asset("assets/school.png"),
     
      loadingText: Text("Loading"),
      photoSize: 100.0,
      loaderColor: Colors.blue,
    );
  }
}
