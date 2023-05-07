import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class flateButton extends StatelessWidget {
   flateButton({Key? key, required this.text}) : super(key: key);
  String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 43.h,
      width: 312.w,
      decoration: BoxDecoration(
        color: Color(0xff86C649).withOpacity(0.7),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Center(child: Text(text, style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold, color: Colors.white),)),
    );
  }
}
