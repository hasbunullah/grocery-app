import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:grocery_app/custom_objects/custom_button.dart';
import 'package:grocery_app/screens/signIn_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ScreenUtilInit(
      splitScreenMode: true,
      minTextAdapt: true,
      designSize: const Size(360, 690),
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: SafeArea(
            child: AnimatedSplashScreen(
              splash: Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(60, 20, 60, 0),
                      child: Image.asset(
                        'assets/images/Untitled-4.png',
                        fit: BoxFit.fitHeight,
                        width: 270.w,
                        height: 470.h,
                      ),
                    ),
                    Text(
                      'Grocery Shop',
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          color: Color(0xff4F504E),
                          fontSize: 33.sp), // Set this
                    ),
                    Text(
                      'at your door',
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          color: Color(0xff4F504E),
                          fontSize: 20.sp), // Set this
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      'The easiest way to buy your \n      grocery shoping',
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          color: Color(0xff212220).withOpacity(0.4),
                          fontSize: 15.sp), // Set this
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    custom_button(text: 'Get Started'),
                  ],
                ),
              ),
              nextScreen: first_screen(),
              splashIconSize: double.infinity,
              splashTransition: SplashTransition.fadeTransition,
            ),
          ),
        );
      },
    ),
  );
}
