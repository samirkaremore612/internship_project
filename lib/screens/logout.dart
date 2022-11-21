import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:internship_project/auth/login.dart';

import 'home.dart';


class LogOut extends StatefulWidget {
  const LogOut({Key? key}) : super(key: key);

  @override
  State<LogOut> createState() => _LogOutState();
}

class _LogOutState extends State<LogOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Card(

          elevation: 30,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Hero(tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('assets/images/app_logo.jfif'),
                  ),),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(15, 60, 40, 20),
                child: Text("You are logged in..\n for logging out click button below! ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20 ),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(onPressed: (){Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (context) =>LoginScreen()));}, child:Text("Log Out") ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavBar(),

    );
  }
}
