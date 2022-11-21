import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:internship_project/auth/registration.dart';
import 'package:internship_project/screens/home.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../globals.dart';

class LoginScreen extends StatefulWidget {
  static String id='login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showSpinner= false;
  final _auth=FirebaseAuth.instance;
  var email;
  var password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(tag: 'logo',
                child: Container(
                  height: 200.0,
                  child: Image.asset('assets/images/app_logo.jfif'),
                ),),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                onChanged: (value) {
                  //Do something with the user input.
                  email=value;
                },
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                onChanged: (value) {
                  //Do something with the user input.
                  password=value;
                },
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Enter your password.',

                  contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),

                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              ElevatedButton( child:Text("Login"),
                  onPressed: ()async{

                 setState(() {
                   FirebaseFirestore.instance
                       .collection('$email')
                       .get()
                       .then((QuerySnapshot querySnapshot) => {
                     querySnapshot.docs.forEach((doc) {
                       age_final=  doc["age"];
                       adress_final=doc["adress"];
                       massage_final=doc["massage"];
                       mobile_no_final=doc["mobile_n0"];
                       username=doc["username"];
                     })
                   });
                 });
                    setState(() {
                      showSpinner=true;
                    });

                    final user= await _auth.signInWithEmailAndPassword(email: email, password: password);
                    if(user!=null) {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (context) =>HomeScreen()));
                    }
                    setState(() {
                      showSpinner=false;
                    });

                  }
              ),
              TextButton(onPressed: (){Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (context) =>RegistrationScreen()));
              }, child: Text("dont have account ? register"))
            ],
          ),
        ),
      ),

    );
  }
}
