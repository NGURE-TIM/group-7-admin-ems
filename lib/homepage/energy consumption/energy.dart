import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:admin/homepage/Data/trends.dart';
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
      body: Container(
        child: AspectRatio(
          aspectRatio:  1.7,
          child: BarChart(BarChartData(
              borderData: FlBorderData(
                  border: const Border(
                    top: BorderSide.none,
                    right: BorderSide.none,
                    left: BorderSide(width: 1),
                    bottom: BorderSide(width: 1),
                  )),
              groupsSpace: 10,
              barGroups: barChartGroupData(myTrends)
              )),
        ),
      ),
    );
  }
}

List<BarChartGroupData>? barChartGroupData (List<Trends> barData){
  List<BarChartGroupData> sections=[];
 int index=-1;
  for (Trends x in barData) {
    index++;
    sections.add( BarChartGroupData(
      x:index,
      barRods: [
        BarChartRodData(
          fromY: 0,
          toY:x.kwh,
          borderRadius: BorderRadius.zero,
          color: Colors.green,
          width: 16,
        ),
      ],
    ));
  }

  return sections;
  }


