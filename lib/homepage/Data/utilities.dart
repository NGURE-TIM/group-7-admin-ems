import 'package:flutter/material.dart';
class Utility{
  String utility;
  double kw;
  Color color;
  double quantity;
  double rating;
  double hours;
  String imagepath;


  Utility(this.utility,this.kw,this.color,this.quantity,this.rating,this.hours, this.imagepath);
}

List<Utility>utilities=[
  Utility('Lighting', 88.2, Colors.blue,515,36,16,'assets/images/realistic-light-bulb-with-electricity_23-2149129410-removebg-preview (1).png'),
  Utility('Computers', 112, Colors.green,249,200,8,'assets/images/laptop-with-white-screen-isolated-white-wall_231208-8594-removebg-preview.png'),
  Utility('Printers', 200, Colors.red,8,50,4,'assets/images/printer-with-white-sheets_1232-570-removebg-preview.png'),
  Utility('Landline phone', 47.52, Colors.yellow,99,2,8,'assets/images/black-realistic-retro-dial-phone-wired-landline-isolated-with-shadows_1284-33941-removebg-preview.png'),
  Utility('Fan', 22.5, Colors.orange,5,50,3,'assets/images/electric-fan_1308-41912-removebg-preview.png'),
  Utility('Routers', 11.5, Colors.purple,23,20,25,''),
  Utility('Cooking coil', 31.5, Colors.pink,7,1500,3,''),
  Utility('Sound system', 10.5, Colors.greenAccent,1,500,1,''),

];

/*Utility('Electric kettles', 184.8, Colors.brown),
  Utility('ATM machine', 0, Colors.indigo),
  Utility('Microwave', 24, Colors.white),
  Utility('Shredder', 12, Colors.orangeAccent),
  Utility('Refrigerator', 250, Colors.blueGrey),
  Utility('Water dispenser', 48, Colors.cyanAccent),
  Utility('Photocopier', 1.36, Colors.teal),
  Utility('Scanners', 0.624, Colors.deepOrangeAccent),
  Utility('Television', 1.792, Colors.cyan),
  Utility('CCTVs', 24.48, Colors.amberAccent),*/