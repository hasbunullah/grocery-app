import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:grocery_app/custom_objects/custom_addedItemContainer.dart';
import 'package:grocery_app/custom_objects/custom_text.dart';
import 'package:grocery_app/custom_objects/flate_button.dart';
import 'package:grocery_app/screens/order_conformation.dart';

class cart_screen extends StatelessWidget {
  const cart_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                  onTap: (){
                    Get.back();
                  }
                  ,child: Icon(Icons.arrow_back)),
                 custom_text(text: 'My Cart'),
                  Text(''),
                ],
              ),
              SizedBox(
                height: 55.h,
              ),
              addedCartContainer(
                  image: 'assets/images/apple.png',
                  fruitName: 'Apple',
                  price: '150.00',
                  weight: '1kg price'),
              SizedBox(height: 20.h),
              addedCartContainer(
                  image: 'assets/images/tomato.png',
                  fruitName: 'Tomato',
                  price: '100.00',
                  weight: '1 kg price'),
              SizedBox(height: 20.h),
              addedCartContainer(
                  image: 'assets/images/appleleaf.png',
                  fruitName: 'Cheery',
                  price: '160.00',
                  weight: '1kg price'),
              SizedBox(
                height: 59.h,
              ),
              GestureDetector(
                  onTap: (){
                    Get.to(order_conformation(), transition: Transition.size, duration: Duration(seconds: 1));
                  },
                  child: flateButton(text: 'Checkout',)),
            ],
          ),
        ),
      ),
    );
  }
}
