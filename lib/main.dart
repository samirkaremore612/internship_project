
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:internship_project/auth/registration.dart';
import 'screens/home.dart';

void main() async{
 WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: FirebaseOptions(apiKey:"AIzaSyD1cpxtfQl6aYPT7Jomk9VrdWXZ2FII32U",
          appId: "1:764470645757:web:5d41a0cefedb5b72623f94",
          messagingSenderId: "764470645757", projectId:
          "intershipproject-b787e")
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home:RegistrationScreen(),
    );
  }
}
