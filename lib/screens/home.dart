import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:internship_project/globals.dart';
import 'package:internship_project/screens/delete.dart';
import 'package:internship_project/screens/logout.dart';
import 'package:internship_project/screens/profile.dart';
import 'package:internship_project/auth/registration.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var size, height, width,age_final;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
        body: Column(
          children: [
            appBar(),
            GetInfo(),
          ],
        ),
      bottomNavigationBar: NavBar(),
    );
  }
}

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(),
      elevation: 30,
      color: Colors.white,
      child: SingleChildScrollView(
        child: GNav(
          rippleColor: Colors.greenAccent, // tab button ripple color when pressed
          hoverColor: Colors.greenAccent, // tab button hover color
          haptic: true, // haptic feedback
          tabBorderRadius: 15,  // tab button border
          tabBorder: Border.all(color: Colors.black, width: 1), // tab button border
          tabShadow: [BoxShadow(color: Colors.white54.withOpacity(0.5), blurRadius: 8)], // tab button shadow
           // tab animation curves
          duration: Duration(milliseconds: 900), // tab animation duration
          gap: 8, // the tab button gap between icon and text
          color: Colors.grey[800], // unselected icon color
          // selected icon and text color
          iconSize: 24, // tab button icon size
           // selected tab background color
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          tabs: [
            GButton(
              icon: Icons.home,
              // text: "home",
              onPressed: () {
                setState(() {

                });
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
            ),
            GButton(
              icon: Icons.contacts,
              // text: 'profile',
              onPressed: () {

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


                    })
                  });
                });
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfilePage()));
                setState(() {
                  age_final=age_final;
                  adress_final=adress_final;
                  mobile_no_final=mobile_no_final;
                  massage_final=massage_final;
                });
              },

            ),
            GButton(
              icon: Icons.delete,
              // text: "Delete Info",
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DeleteInfo()));
              },
            ),
            GButton(icon: Icons.logout_rounded,
              // text: "log out",
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LogOut()));
              },),
          ],
        ),
      ),
    );
  }
}


class appBar extends StatelessWidget {
  const appBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Card(
            elevation: 30,
            shadowColor: Colors.white70,
            color: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(4, 30, 100, 2),
                      child: Text(
                        "Hello There..\n $username\n",
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: Hero(tag: 'logo',
                        child: Container(
                          height: 100.0,
                          child: Image.asset('assets/images/app_logo.jfif'),
                        ),),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GetInfo extends StatefulWidget {
  const GetInfo({Key? key}) : super(key: key);

  @override
  State<GetInfo> createState() => _GetInfoState();
}

class _GetInfoState extends State<GetInfo> {
  TextEditingController ageController = TextEditingController();
  TextEditingController mobileNoCntroller = TextEditingController();
  TextEditingController adressCntroller = TextEditingController();
  TextEditingController massageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5))),
        elevation: 30,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    adress = value;
                  });
                },
                controller: adressCntroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Adress',
                  hintText: 'Enter your adress here',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    mobile_no = value;
                  });
                },
                controller: mobileNoCntroller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Mobile No',
                    hintText: 'Enter your Mobile No'),
                keyboardType: TextInputType.phone,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    age = value;
                  });
                },
                controller: ageController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Age',
                    hintText: 'Enter your age here'),
                keyboardType: TextInputType.phone,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(8, 8, 8, 20),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    massage = value;
                  });
                  //Do something with the user input.
                },
                controller: massageController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'any massage',
                  hintText: 'any massge or feedback for us',
                ),
              ),
            ),
            Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 4, 20, 5),
                  child: ElevatedButton(
                      onPressed: () {

                        print("$massage");
                        FirebaseFirestore.instance.collection('$email_id').add(
                          {
                            'massage': '$massage',
                            'adress': '$adress',
                            'mobile_no': '$mobile_no',
                            'age': '$age',
                            'username':'$username'
                          },
                        );
                       //  FirebaseFirestore.instance
                       //      .collection('null')
                       //      .get()
                       //      .then((QuerySnapshot querySnapshot) => {
                       //  querySnapshot.docs.forEach((doc) {
                       // age_final=  doc["age"];
                       //
                       //  })
                       //  }

                      },
                      child: Text(
                        "Submit details",
                        style: TextStyle(color: Colors.white70),
                      )),
                ))
          ],
        ),
      ),
    ));
  }
}
