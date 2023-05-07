import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:grocery_app/screens/cart_screen.dart';

class item_details extends StatelessWidget {
  const item_details({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 300.h,
                  width: double.infinity,
                ),
                Container(
                  height: 250.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Color(0xffAEDC81).withOpacity(0.5),
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(150.r),
                          bottomLeft: Radius.circular(150.r))),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: CircleAvatar(
                              child: Icon(
                                Icons.arrow_back,
                                color: Colors.black,
                              ),
                              backgroundColor:
                                  Color(0xffAEDC81).withOpacity(0.5),
                            )),
                        Image.asset('assets/images/heart2.png'),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  child: Image.asset(
                    'assets/images/freshApple.png',
                  ),
                  top: 25,
                  right: 5,
                  left: 5,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      AnimatedTextKit(
                        animatedTexts: [
                          ScaleAnimatedText('Apple',
                              textStyle: TextStyle(
                                  fontSize: 25.sp, fontWeight: FontWeight.bold),
                              duration: Duration(seconds: 2))
                        ],
                      ),
                      Spacer(),
                      CircleAvatar(
                          radius: 10.r,
                          backgroundColor: Color(0xffAEDC81),
                          child: Center(
                              child: Image.asset('assets/images/minus.png'))),
                      Text(' 1kg '),
                      CircleAvatar(
                          radius: 10.r,
                          backgroundColor: Color(0xffAEDC81),
                          child: Center(
                              child: Image.asset('assets/images/plus.png'))),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text('Fruits'),
                  Row(
                    children: [
                      Text('4.5'),
                      SizedBox(
                        height: 30.h,
                      ),
                      Image.asset('assets/images/stars.png'),
                      SizedBox(
                        height: 3.h,
                      ),
                      Text(
                        '(89 reviews)',
                        style: TextStyle(color: Color(0xff868889)),
                      )
                    ],
                  ),
                  Text(
                    '₹180.00',
                    style: TextStyle(color: Color(0xff6CC51D)),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text('Description',
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.bold)),
                  Text(
                    'Apple Mountian works as a seller for many\napples growers of apple. apples are easy to spot\nin your produce aisel. They are just like regular\napple,but they will usually have afew more scars on',
                    style: TextStyle(color: Color(0xff868889)),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.to(cart_screen(),
                              transition: Transition.size,
                              duration: Duration(seconds: 1));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(2, 4),
                                    blurRadius: 2,
                                    color: Colors.black.withOpacity(0.2),
                                    spreadRadius: 1.r)
                              ]),
                          height: 34.h,
                          width: 134.w,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 8.w,
                              ),
                              Icon(Icons.shopping_cart,
                                  color: Color(0xff82CD47).withOpacity(0.7)),
                              SizedBox(
                                width: 8.w,
                              ),
                              Text(
                                'Add to Cart',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff82CD47).withOpacity(0.7),
                                    fontSize: 18.sp),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 31.w,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0xff82CD47).withOpacity(0.8),
                            borderRadius: BorderRadius.circular(8.r),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(2, 4),
                                  blurRadius: 2.r,
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 1.r)
                            ]),
                        height: 34.h,
                        width: 127.w,
                        child: Center(
                            child: Text(
                          'Buy Now',
                          style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
