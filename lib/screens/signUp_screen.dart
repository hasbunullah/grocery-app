import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:grocery_app/screens/signIn_screen.dart';
import '../custom_objects/custom_button.dart';
import '../custom_objects/custom_textFormField.dart';

class signUp_screen extends StatefulWidget {
  signUp_screen({Key? key}) : super(key: key);

  @override
  State<signUp_screen> createState() => _signUp_screenState();
}

class _signUp_screenState extends State<signUp_screen> {
  bool loading = false;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();
  final auth = FirebaseAuth.instance;
  String uid= FirebaseAuth.instance.currentUser!.uid;

  void createUser() async {
    if (emailController.text != '' &&
        passwordController.text != '' &&
        nameController.text != '' &&
        confirmpasswordController.text != '' &&
        passwordController.text == confirmpasswordController.text) {
      try {
        UserCredential credential = await auth.createUserWithEmailAndPassword(
            email: emailController.text.trim().toString(),
            password: passwordController.text.trim().toString());

        if (credential.user != null) {
          Fluttertoast.showToast(
              msg: 'User Added',
              textColor: Colors.white,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              fontSize: 16,
              backgroundColor: Colors.pink,
              timeInSecForIosWeb: 2);
          Get.to(first_screen(),
              transition: Transition.size, duration: Duration(seconds: 1));
        }
      } catch (e) {}
      // catch (e) {
      //   Fluttertoast.showToast(
      //       msg: e.toString(),
      //       textColor: Colors.white,
      //       toastLength: Toast.LENGTH_SHORT,
      //       gravity: ToastGravity.BOTTOM,
      //       fontSize: 16,
      //       backgroundColor: Colors.pink,
      //       timeInSecForIosWeb: 2);
      // }
    }
    // else if (passwordController.text != confirmpasswordController.text) {
    //   Fluttertoast.showToast(
    //       msg: "Password Does't Matched",
    //       textColor: Colors.white,
    //       toastLength: Toast.LENGTH_SHORT,
    //       gravity: ToastGravity.BOTTOM,
    //       fontSize: 16,
    //       backgroundColor: Colors.pink,
    //       timeInSecForIosWeb: 2);
    // }
    else {
      Fluttertoast.showToast(
          msg: 'Fill all the fields',
          textColor: Colors.white,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          fontSize: 16,
          backgroundColor: Colors.pink,
          timeInSecForIosWeb: 2);
    }
  }
  
  void uploadData(){
    FirebaseFirestore.instance.collection('UserInfo').doc(uid).update({
      "Name" : nameController.text,
    });
  }
  
  
  

  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 38,
            right: 38,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 5,
                ),
                child: Image.asset('assets/images/logo.png',
                    height: 231.h, width: 300.w),
              ),
              Center(
                  child: Text(
                'Sign Up',
                style: TextStyle(
                    color: Color(0xff82CD47),
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none),
              )),
              SizedBox(
                height: 5.h,
              ),
              Text('Name',
                  style: TextStyle(
                      color: Color(0xff000000).withOpacity(0.5),
                      fontSize: 20.sp,
                      decoration: TextDecoration.none)),
              SizedBox(
                height: 5.h,
              ),
              SizedBox(
                  height: 45.h,
                  child: custom_text_form_field(
                    validate: MultiValidator([
                      RequiredValidator(errorText: 'Name Required'),
                    ]),
                    obscureText: false,
                    text: 'Jhon David',
                    controller: nameController,
                  )),
              SizedBox(
                height: 5.h,
              ),
              Text('Email',
                  style: TextStyle(
                      color: Color(0xff000000).withOpacity(0.5),
                      fontSize: 20.sp,
                      decoration: TextDecoration.none)),
              SizedBox(
                height: 5.h,
              ),
              SizedBox(
                height: 45.h,
                child: custom_text_form_field(
                  validate: MultiValidator([
                    EmailValidator(errorText: 'Enter a valid email address'),
                    RequiredValidator(errorText: 'Email Required'),
                  ]),
                  obscureText: false,
                  controller: emailController,
                  text: 'bunny@gmail.com',
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text('Password',
                  style: TextStyle(
                      color: Color(0xff000000).withOpacity(0.5),
                      fontSize: 20.sp,
                      decoration: TextDecoration.none)),
              SizedBox(
                height: 5.h,
              ),
              SizedBox(
                height: 45.h,
                child: custom_text_form_field(
                    validate: MultiValidator([
                      RequiredValidator(errorText: 'password is required'),
                      MinLengthValidator(6,
                          errorText: 'password must be at least 6 digits long'),
                    ]),
                    obscureText: obscureText,
                    controller: passwordController,
                    text: '.............',
                    icon: GestureDetector(
                      onTap: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                      child: Icon(
                        obscureText ? Icons.visibility_off : Icons.visibility,
                        color: Colors.green,
                      ),
                    )),
              ),
              Text('Confirm Password',
                  style: TextStyle(
                      color: Color(0xff000000).withOpacity(0.5),
                      fontSize: 20.sp,
                      decoration: TextDecoration.none)),
              SizedBox(
                height: 5.h,
              ),
              SizedBox(
                height: 45.h,
                child: custom_text_form_field(
                    validate: MultiValidator([
                      RequiredValidator(errorText: 'password is required'),
                      MinLengthValidator(6,
                          errorText: 'password must be at least 6 digits long'),
                    ]),
                    obscureText: obscureText,
                    controller: confirmpasswordController,
                    text: '.............',
                    icon: GestureDetector(
                      onTap: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                      child: Icon(
                        obscureText ? Icons.visibility_off : Icons.visibility,
                        color: Colors.green,
                      ),
                    )),
              ),
              SizedBox(
                height: 25.h,
              ),
              GestureDetector(
                  onTap: () {
                    createUser();
                    uploadData();
                  },
                  child: loading
                      ? CircularProgressIndicator()
                      : custom_button(text: 'Sign Up')),
              SizedBox(
                height: 15.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have any account ? ",
                      style: TextStyle(
                          color: Color(0xff868889).withOpacity(0.8),
                          fontSize: 14.sp,
                          decoration: TextDecoration.none)),
                  Text('Sign In',
                      style: TextStyle(
                          color: Color(0xff82CD47).withOpacity(0.8),
                          fontSize: 14.sp,
                          decoration: TextDecoration.none)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
