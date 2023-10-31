import 'package:flutter/material.dart';
import 'package:admin/homepage/widgets/widgets.dart';
import'package:admin/homepage/Constants/colorConsts/colors.dart';



class Load extends StatelessWidget {
  String title;
  double quantity;
  double rating;
  double hours;
  String path;
  Load(this.title,this.quantity,this.rating,this.hours, this.path);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: Colors.white,

      body: Container(
child: Column(

  children: [
    Container(
      height: 70,
    ),
    Container(
      height: 380,
      width: 800,
      child: Image.asset(path),
    ),
    Text(
      title,
      style: const TextStyle(
        color:black,
        fontSize: 22,
        fontWeight:FontWeight.w800,
      ),
    ),
    Container(
      height: 40,
    ),
    buildRows('QUANTITY :',quantity ),
    buildRows('Rating(Watts) :', rating ),
    buildRows('Hours of operation :',hours ),
  ],
),
      ),
    );
  }
}


