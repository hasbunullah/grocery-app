import 'package:flutter/material.dart';

class custom_Contaier2 extends StatelessWidget {
  custom_Contaier2(
      {Key? key,
      required this.image,
      required this.ItemName,
      required this.price,
      required this.weight})
      : super(key: key);

  String image;
  String ItemName;
  String price;
  String weight;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: 130,
              height: 152,
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
                    ItemName,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16.3),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    price,
                    style: TextStyle(
                        color: Color(0xff6CC51D), fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    weight,
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xff868889),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              child: CircleAvatar(
                radius: 15,
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                backgroundColor: Color(0xff86C649),
              ),
              bottom: 8,
              right: 5,
            )
          ],
        ),
      ],
    );
    ;
  }
}
