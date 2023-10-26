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
        child: Column(

          children: [
            SizedBox(
              height: 90,
            ),
            Text(
                'Energy Consumption',
              style: TextStyle(
                fontSize: 20
              ),

            ),
            SizedBox(
              height: 30,
            ),
            AspectRatio(
              aspectRatio:  1.7,
              child: BarChart(
                  BarChartData(
                   barTouchData: BarTouchData(
                     enabled: true,
                     touchTooltipData: BarTouchTooltipData(
                       tooltipBgColor: Colors.orangeAccent,
                    getTooltipItem: (BarChartGroupData z , int y , BarChartRodData g , int l){
                        String month;
                        List months=[];
                        for(Trends y in myTrends){
                          months.add(y.month);
                        }
                        if(z.x >=0 && z.x < months.length ){
                          month=months[z.x];
                        }
                        else {
                          throw Error();
                        }
                         return BarTooltipItem(
                             month,

                             const TextStyle(
                             color: Colors.white,
                             fontWeight: FontWeight.bold,
                             fontSize: 18,
                             ),
                           children: <TextSpan>[
                             TextSpan(
                               text: (g.toY - 1).toString(),
                               style: TextStyle(
                                 color: Colors.green,
                                 fontSize: 16,
                                 fontWeight: FontWeight.w500,
                               ),
                             ),
                           ],
                         );
                    }
                     ),

                   ),
                  borderData: FlBorderData(
                      border: const Border(
                        top: BorderSide.none,
                        right: BorderSide.none,
                        left: BorderSide(
                            color: Colors.deepOrange
                        ),
                        bottom: BorderSide(
                            color: Colors.deepOrange
                        ),
                      )),
                  groupsSpace: 10,
                  titlesData:FlTitlesData(
                    show: true,
                    leftTitles: AxisTitles(
                      axisNameWidget: Text(
                        'KWH'
                      )
                    ),
                    bottomTitles: AxisTitles(
                        axisNameWidget: Text(
                            'MONTHS'
                        )
                    )
                  ) ,
                  barGroups: barChartGroupData(myTrends)

                  )),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'TAP TO CHANGE Y AXIS METRIC',
              style: TextStyle(
                  fontSize: 10
              ),

            ),
          ],
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



