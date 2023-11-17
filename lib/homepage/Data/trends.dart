import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

//define our model
class Trends {
  String month;
  double kwh;
  double cost;
  
  Trends(this.kwh,this.month,this.cost);


  Map<String, dynamic> toMap(){
    return{
      'month':month,
      'kwh':kwh,
      'cost':cost
    };
  }
  @override
  String toString(){
    return'Trends{month:$month}';
  }

}
List<Trends> myTrends=[
  Trends(27500, 'March  ', 6920.41),
  Trends(20000, 'April ',4221.00),
  Trends(25000, 'May ',5226.76),
  Trends(22500, 'June ',5631.47),
  Trends(23000, 'July ',5951.83),
  Trends(24000, 'August ',8835.60),
];