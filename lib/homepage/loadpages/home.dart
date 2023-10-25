
import'package:flutter/material.dart';
import 'package:admin/homepage/widgets/widgets.dart';
import '../Data/utilities.dart';

class home extends StatefulWidget {
  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Center(
          child: Text(
            'UTILITY LOADS',
                style:TextStyle(
              color: Colors.white
          ),
          ),
        )
      ),
      body:Container(
        child: Column(
          children: [
            Container(
             height:47,
            ),
            MyPieChart(),
           const SizedBox(
              height: 20,
            ),
            buildListview(utilities),
          ],
        ),
      ),
    );
  }
}
