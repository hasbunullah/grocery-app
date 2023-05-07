import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class customRowWidget extends StatelessWidget {
   customRowWidget({Key? key, required this.text, required this.icon}) : super(key: key);

  String text;
  dynamic icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        SizedBox(width: 14.w,),
        Text(text),
        Spacer(),
        Icon(Icons.arrow_forward_ios),
      ],
    );
  }
}
