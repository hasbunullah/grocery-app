import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:grocery_app/custom_objects/custom_cartContainer.dart';
import 'package:grocery_app/screens/fruits.dart';
import 'package:grocery_app/screens/item_details.dart';
import 'package:animations/animations.dart';
import 'package:grocery_app/screens/profile_screen.dart';

class home_screen extends StatefulWidget {
  const home_screen({Key? key}) : super(key: key);

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Get.to(fruits(), transition:  Transition.size, duration: Duration(seconds: 1));
        },
        child: Icon(Icons.forward),
        backgroundColor: Colors.deepPurple,
      ),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/images/menu-bar 1.png'),
                  Text(
                    'Home',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  GestureDetector(
                    onTap: (){
                      Get.to(profile_screen(), transition: Transition.size, duration:  Duration(seconds: 1));
                    },
                    child: CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage('assets/images/pic2.jpg')),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Hello Bunny!',
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                'What are you Looking for ?',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                  decoration: InputDecoration(
                border: InputBorder.none,
                filled: true,
                fillColor: Color(0xffF4F5F9),
                hintText: 'Search Keywords..',
                hintStyle: TextStyle(color: Color(0xff000000).withOpacity(0.3)),
                suffixIcon: Image.asset('assets/images/Group.png'),
                prefixIcon: Icon(Icons.search),
              )),
              SizedBox(
                height: 5,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xff86C649).withOpacity(0.8),
                ),
                height: 121,
                width: double.infinity,
                child: Row(
                  children: [
                    Image.asset('assets/images/fruit.png'),
                    Column(
                      children: [
                        SizedBox(
                          height: 24,
                        ),
                        Text(
                          '     Exclusive Offer \n Get 30% Off On fruit',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xffF55959),
                          ),
                          width: 106,
                          height: 28,
                          child: Center(
                              child: Text(
                            'Order Now',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          )),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 14,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Categories',
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff212220).withOpacity(0.9),
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 11,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Image.asset('assets/images/Rectangle 9.png'),
                        Text('fruits'),
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset('assets/images/Rectangle 10.png'),
                        Text('Meat'),
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset('assets/images/Rectangle 11.png'),
                        Text('Rice'),
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset('assets/images/Rectangle 12.png'),
                        Text('Meals'),
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset('assets/images/Rectangle 13.png'),
                        Text('Bakery'),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Featured Products',
                style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff212220).withOpacity(0.9),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),

              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 10,
                  children: [
                    GestureDetector(
                      child: custom_cartContainer(
                          discount: '-16%',
                          ItemName: 'Apple',
                          price: '₹180.00',
                          weight: '1kg',
                          image: 'assets/images/apple.png'),onTap: (){
                        Get.to(item_details(), transition: Transition.size, duration: Duration(seconds: 1));

                    },
                    ),
                    custom_cartContainer(
                        discount: '-16%',
                        ItemName: 'Pineapple',
                        price: '₹170.00',
                        weight: '1.2kg',
                        image: 'assets/images/pineapple.png'),
                    custom_cartContainer(
                        discount: 'NEW',
                        ItemName: 'Pomegranate',
                        price: '₹190.00',
                        weight: '1kg',
                        image: 'assets/images/pomegranate.png'),
                    custom_cartContainer(
                        discount: 'NEW',
                        ItemName: 'Orange',
                        price: '₹150.00',
                        weight: '1kg',
                        image: 'assets/images/orange.png'),
                  ],
                ),
              ),
             ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 55,
        child: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    size: 25,
                    color: Colors.black,
                  ),
                  label: '',
                  backgroundColor: Colors.white),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.shopping_cart,
                    size: 25,
                    color: Colors.black,
                  ),
                  label: '',
                  backgroundColor: Colors.white),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.doorbell_outlined,
                    size: 25,
                    color: Colors.black,
                  ),
                  label: '',
                  backgroundColor: Colors.white),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  size: 25,
                  color: Colors.black,
                ),
                label: '',
                backgroundColor: Colors.white,
              ),
            ],
            type: BottomNavigationBarType.shifting,
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.green,
            iconSize: 40,
            onTap: _onItemTapped,
            elevation: 5),
      ),
    );
  }
}
