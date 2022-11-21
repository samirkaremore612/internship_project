import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:internship_project/globals.dart';

import 'home.dart';

class DeleteInfo extends StatefulWidget {
  const DeleteInfo({Key? key}) : super(key: key);

  @override
  State<DeleteInfo> createState() => _DeleteInfoState();
}

class _DeleteInfoState extends State<DeleteInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Hero(tag: 'logo',
              child: Container(
                height: 200.0,
                child: Image.asset('assets/images/app_logo.jfif'),
              ),),
          ),

          Padding(
            padding: EdgeInsets.fromLTRB(50, 30, 50, 20),
            child: Text("If You wanna delete your Info\n press the button below to delete",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
          ),
          ElevatedButton(onPressed: ()async {
            FirebaseFirestore.instance.collection('$email_id').snapshots().forEach((querySnapshot) {
              for (QueryDocumentSnapshot docSnapshot in querySnapshot.docs) {
                docSnapshot.reference.delete();
              }
            });
            setState(() {
               age_final=null;
               massage_final=null;
              adress_final=null;
               mobile_no_final=null;
            });

          }, child: Text("Delete info"))
        ],

      ),
    );
  }
}
