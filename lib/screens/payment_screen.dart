import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:grocery_app/custom_objects/custom_text.dart';
import 'package:grocery_app/custom_objects/flate_button.dart';
import 'package:grocery_app/screens/confirmation_screen.dart';
import 'package:audioplayers/audioplayers.dart';

class payment_screen extends StatelessWidget {
   payment_screen({Key? key}) : super(key: key);

  final AudioCache player= AudioCache();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 17, right: 17),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(23),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                  onTap: (){
                    Get.back();
                  },child: Icon(Icons.arrow_back)),
                  custom_text(text: 'Payment'),
                  Text(''),
                ],
              ),
            ),
            SizedBox(
              height: 66.h,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  color: Color(0xffF5F5F5),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 3),
                      color: Colors.grey.withOpacity(0.3),
                    )
                  ]),
              width: double.infinity,
              height: 94.h,
              child: Row(
                children: [
                  SizedBox(
                    width: 38.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 17.h,
                      ),
                      custom_text(text: 'Amount To Pay'),
                      SizedBox(
                        height: 6.h,
                      ),
                      Text(
                        '₹160.00',
                        style: TextStyle(
                            color: Color(0xff6CC51D),
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Spacer(),
                  Text(
                    'Detail',
                    style: TextStyle(color: Color(0xff6CC51D), fontSize: 18.sp),
                  ),
                  SizedBox(
                    width: 25.w,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  color: Color(0xffF5F5F5),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 3),
                      color: Colors.grey.withOpacity(0.3),
                    )
                  ]),
              width: double.infinity,
              height: 94.h,
              child: Row(
                children: [
                  SizedBox(
                    width: 38.w,
                  ),
                  Image.asset('assets/images/Vector.png'),
                  SizedBox(
                    width: 22.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      custom_text(text: 'Master Card'),
                      SizedBox(
                        height: 6.h,
                      ),
                      Text(
                        '0000 0000 0000 0000',
                        style: TextStyle(
                            fontSize: 16.sp,
                            color: Color(0xff585858),
                            fontWeight: FontWeight.values[4]),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 26.h,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 54, right: 45),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Price',
                        style:
                            TextStyle(color: Color(0xff585858), fontSize: 15.sp),
                      ),
                      Text(
                        '₹160.00',
                        style: TextStyle(
                            color: Color(0xff6CC51D),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 22.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Delivery Charge',
                        style:
                            TextStyle(color: Color(0xff585858), fontSize: 15.sp
                            ),
                      ),
                      Text(
                        '₹50.00',
                        style: TextStyle(
                            color: Color(0xff6CC51D),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 22.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style:
                            TextStyle(color: Color(0xff585858), fontSize: 15.sp),
                      ),
                      Text(
                        '₹210.00',
                        style: TextStyle(
                            color: Color(0xff6CC51D),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 126.h,
            ),
            GestureDetector(
                onTap: () {
                  Get.to(confirmation_screen(), transition:  Transition.size, duration: Duration(seconds: 1));

                },
                child: flateButton(text: 'Pay Now')),
          ],
        ),
      ),
    ));
  }
}
