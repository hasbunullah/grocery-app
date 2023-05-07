import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:grocery_app/custom_objects/custom_button.dart';
import 'package:grocery_app/screens/home_screen.dart';
import 'package:grocery_app/screens/signUp_screen.dart';
import '../custom_objects/custom_textFormField.dart';

class first_screen extends StatefulWidget {
  first_screen({Key? key}) : super(key: key);

  @override
  State<first_screen> createState() => _first_screenState();
}

class _first_screenState extends State<first_screen> {

  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final auth = FirebaseAuth.instance;


  void login() async {
    if (emailController.text.trim() != '' &&
        passwordController.text.toString() != '') {
      try {
        final credential = await auth.signInWithEmailAndPassword(
            email: emailController.text.trim().toString(),
            password: passwordController.text.trim().toString());

        if (credential.user != '') {

          Get.to(home_screen(),
              transition: Transition.size, duration: Duration(seconds: 1));
          Fluttertoast.showToast(
              msg: 'Success',
              textColor: Colors.white,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              fontSize: 16,
              backgroundColor: Colors.pink,
              timeInSecForIosWeb: 2);
        }
      } catch (e) {
        Fluttertoast.showToast(
            msg: e.toString(),
            textColor: Colors.white,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            fontSize: 16,
            backgroundColor: Colors.pink,
            timeInSecForIosWeb: 2);
      }
    } else {
      Fluttertoast.showToast(
          msg: 'Fill both fields',
          textColor: Colors.white,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          fontSize: 16,
          backgroundColor: Colors.pink,
          timeInSecForIosWeb: 2);
    }
  }

  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(
          left: 38,
          right: 38,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 48,
                ),
                child: Image.asset('assets/images/logo.png',
                    height: 231.h, width: 300.w),
              ),
              Center(
                  child: Text(
                'Sign In',
                style: TextStyle(
                    color: Color(0xff82CD47),
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none),
              )),
              SizedBox(
                height: 10.h,
              ),
              Text('Email',
                  style: TextStyle(
                      color: Color(0xff000000).withOpacity(0.5),
                      fontSize: 20.sp,
                      decoration: TextDecoration.none)),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                  height: 45.h,
                  child: custom_text_form_field(
                    validate:  MultiValidator([
                      EmailValidator(errorText: 'Enter a valid email address'),
                      ]),
                    obscureText: false,
                    text: 'Enter User Email',
                    controller: emailController,
                  )),
              SizedBox(
                height: 10.h,
              ),
              Text('Password',
                  style: TextStyle(
                      color: Color(0xff000000).withOpacity(0.5),
                      fontSize: 20.sp,
                      decoration: TextDecoration.none)),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                height: 45.h,
                child: custom_text_form_field(
                  validate:  MultiValidator([
                    RequiredValidator(errorText: 'password is required'),
                    MinLengthValidator(6, errorText: 'password must be at least 6 digits long'),
                     ]),
                  obscureText: obscureText,
                  controller: passwordController,
                  text: 'Enter Password',
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
                  ),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                children: [
                  Spacer(),
                  Text('Forget Ppassword?',
                      style: TextStyle(
                          color: Color(0xff82CD47).withOpacity(0.8),
                          fontSize: 14.sp,
                          decoration: TextDecoration.none)),
                ],
              ),
              SizedBox(
                height: 23.h,
              ),
              GestureDetector(
                  onTap: () {
                    login();
                  },
                  child: custom_button(text: 'Sign In')),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/mdi_google.png'),
                  SizedBox(
                    width: 2.w,
                  ),
                  Text('Login with google'),
                ],
              ),
              SizedBox(
                height: 40.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 30),
                child: Row(
                  children: [
                    Text("Don't have any account ? ",
                        style: TextStyle(
                            color: Color(0xff868889).withOpacity(0.8),
                            fontSize: 14.sp,
                            decoration: TextDecoration.none)),
                    GestureDetector(
                      onTap: () {
                        Get.to(signUp_screen(),
                            transition: Transition.size,
                            duration: Duration(seconds: 1));
                      },
                      child: Text('Sign Up',
                          style: TextStyle(
                              color: Color(0xff82CD47).withOpacity(0.8),
                              fontSize: 14.sp,
                              decoration: TextDecoration.none)),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
