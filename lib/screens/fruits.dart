import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:grocery_app/custom_objects/custom_Container2.dart';
import 'package:grocery_app/screens/searchScreen.dart';

import '../custom_objects/custom_cartContainer.dart';
import 'item_details.dart';

class fruits extends StatelessWidget {
  const fruits({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.forward_outlined),
          onPressed: (){
        Get.to(searchScreen(), transition: Transition.size, duration: Duration(seconds: 1));
      }),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(Icons.arrow_back)),
              ),
              SizedBox(
                height: 23,
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Color(0xffF4F5F9),
                  hintText: 'Fruits',
                  hintStyle:
                      TextStyle(color: Color(0xff000000).withOpacity(0.3)),
                  suffixIcon: Image.asset('assets/images/Group.png'),
                  prefixIcon: Icon(Icons.search),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, top: 15),
                  child: GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 10,
                    children: [
                      custom_Contaier2(
                          image: 'assets/images/strawberries1.png',
                          ItemName: 'Straw berries',
                          price: '₹180.00',
                          weight: 'Per kg'),
                      custom_Contaier2(
                          image: 'assets/images/appleleaf.png',
                          ItemName: 'Apple',
                          price: '₹150.00',
                          weight: 'Per kg'),
                      custom_Contaier2(
                          image: 'assets/images/tomato.png',
                          ItemName: 'Tomato',
                          price: '₹100.00',
                          weight: 'Per kg'),
                      custom_Contaier2(
                          image: 'assets/images/orange2.png',
                          ItemName: 'Orange',
                          price: '₹150.00',
                          weight: 'Per kg'),
                      custom_Contaier2(
                          image: 'assets/images/carrot.png',
                          ItemName: 'Carrot',
                          price: '₹120.00',
                          weight: 'Per kg'),
                      custom_Contaier2(
                          image: 'assets/images/cuttedApple.png',
                          ItemName: 'Apple',
                          price: '₹150.00',
                          weight: 'Per kg'),
                      custom_Contaier2(
                          image: 'assets/images/apple.png',
                          ItemName: 'Apple',
                          price: '₹160.00',
                          weight: 'Per kg'),
                      custom_Contaier2(
                          image: 'assets/images/apple.png',
                          ItemName: 'Apple',
                          price: '₹190.00',
                          weight: 'Per kg'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
