import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:grocery_app/custom_objects/customRowWidget.dart';
import 'package:grocery_app/custom_objects/custom_text.dart';
import 'package:grocery_app/screens/signIn_screen.dart';

class profile_screen extends StatefulWidget {
   profile_screen({Key? key}) : super(key: key);


  @override
  State<profile_screen> createState() => _profile_screenState();
}

class _profile_screenState extends State<profile_screen> {

  String Name= '';
  String Email='';
  String Uid= FirebaseAuth.instance.currentUser!.uid;

  void getdata() async{
    DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
        .collection('UserInfo')
        .doc(Uid)
        .get();
    setState((){
      Name = documentSnapshot.get('Name');
      Email = documentSnapshot.get('Email');
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(resizeToAvoidBottomInset: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 33, top: 35),
              child: GestureDetector(
                  onTap: (){
                      Get.back();
                  },
                  child: Icon(Icons.arrow_back)),
            ),
            Center(
              child: CircleAvatar(
                radius: 50.r,
                backgroundImage: AssetImage('assets/images/pic2.jpg'),
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            Center(
                child: custom_text(text: Name.toString())),
            Center(
              child: Text(
                Email.toString(),
                style: TextStyle(fontSize: 12.sp),
              ),
            ),
            SizedBox(height: 50.h,),
            Padding(
              padding: const EdgeInsets.only(left: 45,right: 45),
              child: Container(
                child: Column(
                  children: [
                    custom_text(text: 'Settings'),
                    SizedBox(height: 34.h,),
                    customRowWidget(text: 'User Information',icon: Icons.person,),
                    SizedBox(height: 29.h,),
                    customRowWidget(text: 'My Cart',icon: Icons.shopping_cart,),
                    SizedBox(height: 29.h,),
                    customRowWidget(text: 'My Favourites',icon: Icons.heart_broken,),
                    SizedBox(height: 29.h,),
                    customRowWidget(text: 'Notifications',icon: Icons.notifications,),
                    SizedBox(height: 29.h,),
                    customRowWidget(text: 'Help',icon: Icons.headphones,),
                    SizedBox(height: 29.h,),
                    InkWell(
                        onTap: (){
                          FirebaseAuth.instance.signOut();
                          Get.offAll(first_screen());
                        },
                        child: customRowWidget(text: 'Logout',icon: Icons.logout,)),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
