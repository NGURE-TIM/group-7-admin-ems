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
  Trends(780184.50, 'March  ', 27500),
  Trends(563317.43, 'April ',20000),
  Trends(688509.57, 'May ',25000),
  Trends(619018.22, 'June ',22500),
  Trends(651131, 'July ',23000),
  Trends(651131, 'August ',23000),
  Trends(678409.3, 'September ',23418),
];