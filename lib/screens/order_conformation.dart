import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:grocery_app/custom_objects/custom_button.dart';
import 'package:grocery_app/custom_objects/custom_text.dart';
import 'package:grocery_app/custom_objects/flate_button.dart';
import 'package:grocery_app/screens/payment_screen.dart';

class order_conformation extends StatelessWidget {
  const order_conformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             GestureDetector(
             onTap: (){
               Get.back();
             },child: Icon(Icons.arrow_back)),
             custom_text(text: 'Order Conformation'),
             Text(''),
           ],
         ),
            SizedBox(height: 46.h,),
            custom_text(text: 'Your Details'),
            SizedBox(height: 27.h,),
            Row(
              children: [
                Icon(Icons.location_on_outlined),
                SizedBox(width: 19.w,),
                Text('Theni 105, Periyakulam', style: TextStyle(color: Color(0xff585858).withOpacity(0.9)),),
                Spacer(),
                Text('Edit', style: TextStyle(fontSize: 15.sp, color: Color(0xff6CC51D)),),

              ],
            ),
            SizedBox(height: 14.h,),
            Container(height: 1.h,width: double.infinity.w, color: Colors.black.withOpacity(0.2),),
            SizedBox(height: 21.h,),
            Row(
              children: [
                Icon(Icons.phone_in_talk),
                SizedBox(width: 19.w,),
                Text('9344*******', style: TextStyle(color: Color(0xff585858).withOpacity(0.9)),),
                Spacer(),
                Text('Edit', style: TextStyle(fontSize: 15.sp, color: Color(0xff6CC51D)),),

              ],
            ),
            SizedBox(height: 14.h,),
            Container(height: 1.h,width: double.infinity, color: Colors.black.withOpacity(0.2),),
            SizedBox(height: 21.h,),
            Row(
              children: [
                Icon(Icons.mark_email_unread_outlined),
                SizedBox(width: 19.w,),
                Text('Bunny@gmail.com', style: TextStyle(color: Color(0xff585858).withOpacity(0.9)),),
                Spacer(),
                Text('Edit', style: TextStyle(fontSize: 15.sp, color: Color(0xff6CC51D)),),

              ],
            ),
            SizedBox(height: 46.h,),
            custom_text(text: 'About Order'),
            SizedBox(height: 50.h,),
            Row(
              children: [
                Icon(Icons.delivery_dining),
                SizedBox(width: 19.w,),
                Text('Delivery', style: TextStyle(color: Color(0xff585858).withOpacity(0.9)),),
                Spacer(),
                Text('Select Method', style: TextStyle(fontSize: 15.sp),),
                Icon(Icons.arrow_forward_ios),

              ],
            ),
            SizedBox(height: 14.h,),
            Container(height: 1.h,width: double.infinity, color: Colors.black.withOpacity(0.2),),
            SizedBox(height: 21.h,),

            Row(
              children: [
                Icon(Icons.payment_outlined),
                SizedBox(width: 19.w,),
                Text('Payment Method', style: TextStyle(color: Color(0xff585858).withOpacity(0.9)),),
                Spacer(),
                Icon(Icons.arrow_forward_ios),
              ],
            ),
            SizedBox(height: 14.h,),
            Container(height: 1.h,width: double.infinity, color: Colors.black.withOpacity(0.2),),
            SizedBox(height: 21.h,),
            Row(
              children: [
                Image.asset('assets/images/castIcon.png'),
                SizedBox(width: 19.w,),
                Text('Total cost', style: TextStyle(color: Color(0xff585858).withOpacity(0.9)),),
                Spacer(),
                Text('₹160.00', style: TextStyle(fontSize: 15, color: Color(0xff6CC51D), fontWeight: FontWeight.bold),),
                Icon(Icons.arrow_forward_ios),

              ],
            ),
            SizedBox(height: 14.h,),
            Container(height: 1.h,width: double.infinity, color: Colors.black.withOpacity(0.2),),
            SizedBox(height: 20.h,),
            Center(child: GestureDetector(
                onTap: (){
                  Get.to(payment_screen(), transition:  Transition.size, duration: Duration(seconds: 1));
                },
                child: flateButton(text: 'Confirm Order',))),
          ],
        ),
      ),
    ));
  }
}
