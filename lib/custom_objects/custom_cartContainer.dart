import 'package:flutter/material.dart';

class custom_cartContainer extends StatelessWidget {
  custom_cartContainer(
      {Key? key,
      this.discount,
      required this.ItemName,
      required this.price,
      required this.weight,
      required this.image})
      : super(key: key);

  String? discount;
  String price;
  String ItemName;
  String weight;
  dynamic image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: 180,
              height: 157,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 2,
                    offset: Offset(2.0, 4.0), // Shadow position
                  ),
                ],
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    image,
                    height: 55,
                    width: 150,
                  ),
                  Text(
                    price,
                    style: TextStyle(color: Color(0xff6CC51D)),
                  ),
                  Text(
                    ItemName,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16.3),
                  ),
                  Text(
                    weight,
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xff868889),
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    '-------------------------------',
                    style: TextStyle(
                      color: Color(0xff86C649),
                    ),
                  ),
                  Text(
                    'Add to cart',
                    style: TextStyle(color: Color(0xff86C649), fontSize: 12),
                  ),
                ],
              ),
            ),

            Positioned(
              left: 0,
              right: 100,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xffFEE4E4),
                ),
                height: 25,
                width: 100,
                child: Center(
                  child: Text(
                    discount!,
                    style: TextStyle(color: Color(0xffF56262)),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 130,
              right: 0,
              child: Image.asset('assets/images/heart.png'),
            ),
            Positioned(
                child: CircleAvatar(
                  child: Icon(
                    Icons.shopping_bag_outlined,
                    color: Colors.white,
                  ),
                  backgroundColor: Color(0xff86C649),
                ),
                bottom: 3,
                right: 3)
          ],
        ),
      ],
    );
  }
}


//
