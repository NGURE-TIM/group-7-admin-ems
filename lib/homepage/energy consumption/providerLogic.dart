import 'package:flutter/material.dart';


List _john=[];
class Select extends ChangeNotifier{

 late String metric='kwh';
 late Color y =Colors.green;
 late bool Status1=true;
 late bool Status2=true;
 late String title= 'A BARGRAPH OF COST AGAINST MONTH';
 changeButtonStatus(int button){
   if (Status1==false  && button == 1 && Status2==true){
     Status1=true;
     Status2=false;
   }
   else if (Status1==true && button == 2  && Status2==false )
     {
       Status1=false;
       Status2=true;
     }
   else if (Status1==true && button == 1 && Status2==false )
   {
     Status1=false;
     Status2=true;
   }
   else if (Status1==true  && button == 2 && Status2==true){
     Status1=true;
     Status2=false;
   }




   notifyListeners();
 }
  getMetric(String m , Color x, String l){
   title=l;
    y=x;
    metric=m;
    notifyListeners();
  }





}
class Data extends ChangeNotifier{
  late String month;

  late double kwh;
  late double cost;
 get john =>_john;


  addData(String mwezi){
    _john.add(mwezi);
    notifyListeners();
  }
}