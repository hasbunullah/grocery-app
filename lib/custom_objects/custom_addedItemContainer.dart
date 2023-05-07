import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class addedCartContainer extends StatelessWidget {
   addedCartContainer({Key? key, required this.image, required this.fruitName, required this.price, required this.weight}) : super(key: key);

   String fruitName;
   String price;
   String weight;
   String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 117.h,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            offset: Offset(0, 2),
            color: Colors.black.withOpacity(0.2),

        )]),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              image,
              height: 120.h,
              width: 120.w,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(fruitName, style: TextStyle(color: Colors.black,fontSize: 20.sp, fontWeight: FontWeight.bold),),
                Text(weight,style: TextStyle(color: Color(0xff585858),fontSize: 10.sp)),
                Text(price, style: TextStyle(color: Color(0xff6CC51D),fontSize: 17.sp, fontWeight: FontWeight.bold),)
              ],
            ),
            SizedBox(width: 50.w,),
            CircleAvatar(
                radius: 10.r,
                backgroundColor: Color(0xffAEDC81),
                child: Center(child: Image.asset('assets/images/minus.png'))),
            Text(' 1kg '),
            CircleAvatar(
                radius: 10.r,
                backgroundColor: Color(0xffAEDC81),
                child: Center(child: Image.asset('assets/images/plus.png'))),
          ],
        ),
      ),
    );
  }
}
