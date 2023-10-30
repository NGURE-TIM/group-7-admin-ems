import 'package:flutter/material.dart';
import 'package:admin/homepage/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:admin/homepage/energy consumption/providerLogic.dart';


class energy extends StatefulWidget {
  @override
  State<energy> createState() => _energyState();
}
class _energyState extends State<energy> {
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
                  color: Colors.deepOrange
                ),

              ),
              SizedBox(
                height: 30,
              ),
              Consumer
              <Select>(builder:(context,selectProviderModel,child)=> Text(
                  selectProviderModel.title,
                  style: TextStyle(
                      fontSize: 10
                  ),

                ),
              ),
              SizedBox(
                height: 30,
              ),

              Consumer<Select>(
                builder:(context,selectProviderModel,child)=> AspectRatio(
                  aspectRatio:  1.7,
                  child: buildBarChart(selectProviderModel.metric , selectProviderModel.y),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Press on top of bar-rod to see month',
                style: TextStyle(
                    fontSize:7,
                  color: Colors.deepOrange
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
                      buildButton('kwh',Colors.green,selectProviderModel.Status1 , 1, 'A BARGRAPH OF KWH AGAINST MONTH')),
                  SizedBox(
                    width:10,
                  ),
                  Consumer<Select>(
                      builder:(context,selectProviderModel,child)=> buildButton('cost',Colors.blueGrey,selectProviderModel.Status2, 2, 'A BARGRAPH OF COST AGAINST MONTH')),
                ],
              ),


            ],
          ),
        ),
      ),
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
                        color:buttonState? Colors.green:Colors.blueGrey,
                        borderRadius:BorderRadius.circular(20)
                    ),
          child: Center(
            child: Text(
              buttonname,
              style: TextStyle(
                color:buttonState? Colors.black:Colors.white,
                fontWeight: FontWeight.w800
              ),
            ),
          ),
                  ),
      ),
    );
  }
}


