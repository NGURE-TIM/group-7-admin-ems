
import'package:flutter/material.dart';
import 'package:admin/homepage/widgets/widgets.dart';
import '../Data/utilities.dart';
import'package:admin/homepage/Constants/colorConsts/colors.dart';


class utility extends StatefulWidget {

  @override
  State<utility> createState() => _utilityState();
}

class _utilityState extends State<utility> {
  int value=0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: Container(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'UTILTY LOAD ANAYLSIS',
                style: TextStyle(
                    fontSize: 16,
                    color: deepOrange
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: black.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      color: darkGreen,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  height: 350,
                  width: 800,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'A piechart tabulation of the load against kwh.',
                        style: TextStyle(
                            fontSize: 10
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      MyPieChart(),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Press pie-section to see related load',
                        style: TextStyle(
                            fontSize: 7,
                            color: deepOrange
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              buildListview(utilities)

            ],
          ),
        ),
        extendBody: true,
        bottomNavigationBar: buildFloatingNavbar(value),
      ),
    );
  }
}
