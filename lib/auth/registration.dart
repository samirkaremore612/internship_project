
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:internship_project/auth/login.dart';
import 'package:internship_project/globals.dart';

import '../screens/home.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  static String re_id='RegistrationScreen';
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth=FirebaseAuth.instance;
  //creating auth instance
  String? email;
  String? password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(tag: 'logo',
              child:Container(
                height: 200.0,
                child: Image.asset('assets/images/app_logo.jfif'),
              ),),
            SizedBox(
              height: 48.0,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              onChanged: (value) {
                email= value;
               setState(() {
                 email_id=value;
               });
                //Do something with the user input.
              },
              decoration: InputDecoration(
                hintText: 'Enter your email',
                contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              keyboardType: TextInputType.name,
              textAlign: TextAlign.center,
              onChanged: (value) {
                username= value;
                //Do something with the user input.
              },
              decoration: InputDecoration(
                hintText: 'What we should call you',
                contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              textAlign: TextAlign.center,
              obscureText: true,
              onChanged: (value) {
                password=value;
                //Do something with the user input.
              },
              decoration: InputDecoration(
                hintText: 'Enter your password',
                contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            ElevatedButton(child: Text('Register'),
              onPressed: ()async{
              setState(() {
    FirebaseFirestore.instance
        .collection('$email_id')
        .get()
        .then((QuerySnapshot querySnapshot) => {
    querySnapshot.docs.forEach((doc) {
    age_final=  doc["age"];
    mobile_no_final=doc["mobile_no"];
    adress_final=doc["adress"];
    massage_final=doc["massage"];
    username=doc["username"];
    print("$age");
    })});
    });

                // FirebaseFirestore.instance
                //     .collection('$email')
                //     .get()
                //     .then((QuerySnapshot querySnapshot) => {
                //   querySnapshot.docs.forEach((doc) {
                //     age=  doc["age"];
                //
                //   })
                // });
                try{
                  final newUser=await _auth.createUserWithEmailAndPassword(email: "$email", password: "$password");
                  if(newUser !=null){
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (context) =>HomeScreen()));
                  }
                } catch(e){
                  print(e);
                }

              },),
            TextButton(onPressed: (){Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                    builder: (context) =>LoginScreen()));

              }, child: Text("Already user ? Login"))
          ],
        ),
      ),
    );
  }
}
