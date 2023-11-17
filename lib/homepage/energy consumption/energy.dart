import 'package:flutter/material.dart';
import 'package:admin/homepage/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:admin/homepage/energy consumption/providerLogic.dart';
import'package:admin/homepage/Constants/colorConsts/colors.dart';

class energy extends StatefulWidget {

  @override
  State<energy> createState() => _energyState();
}
class _energyState extends State<energy> {
  int value=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Trends'),
      ),
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context)=>Select())
        ],
        child: Container(
          child: Column(

            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                  'Energy Consumption',
                style: TextStyle(
                  fontSize: 30,
                  color: deepOrange
                ),

              ),
              SizedBox(
                height: 30,
              ),
              Consumer
              <Select>(builder:(context,selectProviderModel,child)=> Text(
                  selectProviderModel.title,
                  style: TextStyle(
                      fontSize: 10,


                  ),

                ),
              ),
              SizedBox(
                height: 30,
              ),

              Consumer<Select>(
                builder:(context,selectProviderModel,child)=> Padding(
                  padding: const EdgeInsets.only(left:10 ,right: 10),
                  child: AspectRatio(
                    aspectRatio:  1.8,
                    child: buildBarChart(selectProviderModel.metric , selectProviderModel.y),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Press on top of bar-rod to see month',
                style: TextStyle(
                    fontSize:7,
                  color: deepOrange
                ),
              ),
              SizedBox(
                height: 30,
              ),
               Text(
                'TAP BUTTON TO CHANGE Y AXIS METRIC',
                style: TextStyle(
                    fontSize: 10
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Consumer<Select>(
                      builder:(context,selectProviderModel,child)=>
                      buildButton('kwh',limeGreen,selectProviderModel.Status1 , 1, 'A BARGRAPH OF KWH AGAINST MONTH')),
                  SizedBox(
                    width:10,
                  ),
                  Consumer<Select>(
                      builder:(context,selectProviderModel,child)=> buildButton('cost',blueGreen,selectProviderModel.Status2, 2, 'A BARGRAPH OF COST AGAINST MONTH')),
                ],
              ),


            ],
          ),
        ),
      ),


      bottomNavigationBar: buildFloatingNavbar(value),
    );
  }

 buildButton(String buttonname ,Color x, bool buttonState, int button ,String title ) {

    return Consumer<Select>(
      builder:(context,selectProviderModel,child)=> GestureDetector(
        onTap: (){
selectProviderModel.getMetric(buttonname,x,title);
selectProviderModel.changeButtonStatus(button);
        },
        child: Container(
                    width: 80,
                    height: 30,
                    decoration: BoxDecoration(
                        color:buttonState? limeGreen: darkGreen,
                        borderRadius:BorderRadius.circular(20)
                    ),
          child: Center(
            child: Text(
              buttonname,
              style: TextStyle(
                color:buttonState? black:white,
                fontWeight: FontWeight.w800
              ),
            ),
          ),
                  ),
      ),
    );
  }
}


