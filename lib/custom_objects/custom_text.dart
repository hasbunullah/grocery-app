import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class custom_text extends StatelessWidget {
   custom_text({Key? key, required this.text}) : super(key: key);

  String text;
  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(fontSize: 20.sp, color: Colors.black, fontWeight: FontWeight.bold),);
  }
}
