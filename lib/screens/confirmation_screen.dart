import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:grocery_app/custom_objects/flate_button.dart';
import 'package:grocery_app/screens/home_screen.dart';
import 'package:audioplayers/audioplayers.dart';

class confirmation_screen extends StatefulWidget {
  confirmation_screen({Key? key}) : super(key: key);

  @override
  State<confirmation_screen> createState() => _confirmation_screenState();
}

class _confirmation_screenState extends State<confirmation_screen> {
  final _confettiController = ConfettiController(
    duration: const Duration(seconds: 4),
  );

  final AudioCache player = AudioCache();

  @override
  initState() {
    player.play('success.wav');
    _confettiController.play();
    super.initState();
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            body: Padding(
              padding: const EdgeInsets.only(left: 30, top: 35, right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 70.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 37, right: 37),
                    child: Image.asset(
                      'assets/images/tick.png',
                      height: 200.h,
                      width: 200.w,
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  Text(
                    'Order Confirmed',
                    style:
                        TextStyle(fontSize: 35.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Text(
                    'Your order has been confirmed',
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: Color(0xff212220).withOpacity(0.7),
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Will be deliverd soon',
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: Color(0xff212220).withOpacity(0.7),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Center(
                      child: Text(
                    'Order Id: 10000090',
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.9)),
                  )),
                  SizedBox(
                    height: 95.h,
                  ),
                  GestureDetector(
                      onTap: () {
                        Get.off(home_screen());
                      },
                      child: flateButton(text: 'Done'))
                ],
              ),
            ),
          ),
          ConfettiWidget(
            numberOfParticles: 20,
            minBlastForce: 10,
            maxBlastForce: 30,
            blastDirectionality: BlastDirectionality.explosive,
            confettiController: _confettiController,
            gravity: 0.1,
            emissionFrequency: 0.09,
            colors: [
              Color(0xff86C649),
              Colors.grey,
            ],
          ),
        ],
      ),
    );
  }
}
