import 'package:admin/homepage/loadpages/utility.dart';
import 'package:flutter/material.dart';
import 'package:admin/homepage/Data/utilities.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:admin/homepage/Data/trends.dart';
import 'package:admin/homepage/loadpages/load.dart';
import'package:admin/homepage/Constants/colorConsts/colors.dart';
import 'package:admin/homepage/energy consumption/energy.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';

class MyPieChart extends StatefulWidget {
  const MyPieChart({Key? key}) : super(key: key);

  @override
  State<MyPieChart> createState() => _MyPieChartState();
}

class _MyPieChartState extends State<MyPieChart> {

  int touchedIndex=0;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.7,
      child: PieChart(
        PieChartData(
          sections: buildPieSections(utilities),
          sectionsSpace: 4,
        pieTouchData: PieTouchData(
          touchCallback: (FlTouchEvent event, pieTouchResponse) {
            setState(() {
              if (!event.isInterestedForInteractions ||
                  pieTouchResponse == null ||
                  pieTouchResponse.touchedSection == null) {
                touchedIndex = -1;
                return;
              }
              touchedIndex =
                  pieTouchResponse.touchedSection!.touchedSectionIndex;
            });
          },
        )

        ),
      ),
    );
  }
  List<PieChartSectionData> buildPieSections(List<Utility>data) {
    List<PieChartSectionData> sections = [];
    int i = -1;
    for (Utility x in data ){
      i++;
      bool isTouched=i==touchedIndex?true:false;
      final fontSize = isTouched ? 12.0 : 6.0;
      final radius = isTouched ? 90.0 : 70.0;
      final fontWeight = isTouched ? FontWeight.w600 : FontWeight.w400;
      final title=isTouched?x.utility:null;

      sections.add(PieChartSectionData(
        color: x.color,
        value: x.kw,
        title: title,
        radius:radius,
        titleStyle: TextStyle(
          fontSize: fontSize,
          fontWeight:fontWeight,
          color: const Color(0xffffffff),
        ),
        titlePositionPercentageOffset: 1.25
      ),

      );
    }
    return sections;
  }
}







buildListview (List<Utility>data) {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              color:jungle.withOpacity(0.4),
              borderRadius: BorderRadius.circular(20)
          ),
          child:Column(
            children: [
              Text(
                'LOADS',
                style: TextStyle(
                    fontSize: 16,
                    color:deepOrange
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Scroll for more loads',
                    style: TextStyle(
                        fontSize: 7,
                        color:badge
                    ),
                  ),
                  Text(
                    'Tap a load to view details',
                    style: TextStyle(
                        fontSize: 7,
                        color:badge
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(itemCount: data.length,
                  itemBuilder:(context,index){
                    Utility item=data[index];
                    return Column(

                      children: [

                        InkWell(

                          onTap:(){

                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => Load(item.utility,item.quantity,item.rating,item.hours,item.imagepath)));

//Navigator.of(context).push(MaterialPageRoute(builder: (context)=>energy()));
                          } ,

                          child: ListTile(

                            leading:Container(

                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                color: item.color,
                              ),
                            ),
                            title: Text(
                              item.utility,
                              style: const TextStyle(
                                color:white,
                                fontSize:10,
                              ),
                            ),
                            trailing: Text(
                              item.kw.toString(),
                              style: const TextStyle(
                                color: backGround,
                                fontSize:10,
                              ),
                            ),
                          ),
                        ),

                      ],
                    );

                  },
                ),
              ),
              SizedBox(
                height: 10,
              )
            ],
          )
      ),
    ),
  );
}

buildRows (String x , double y){
  return  Padding(
    padding: const EdgeInsets.all(10.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,

      children: [
        Text(
          x,
          style: const TextStyle(
              color: black,
              fontWeight: FontWeight.bold,
              fontSize: 15
          ),
        ),
        const SizedBox(width: 100),
        Text(
          y.toString(),
          style: const TextStyle(
              color: black,
              fontWeight: FontWeight.bold
          ),

        ),
      ],
    ),
  );

}




class buildBarChart extends StatelessWidget {
   String metric;
  Color x;

  buildBarChart(this.metric , this.x);
  @override
  Widget build(BuildContext context) {
    return BarChart(
        BarChartData(
            barTouchData: BarTouchData(
              enabled: true,
              touchTooltipData: BarTouchTooltipData(
                  tooltipBgColor: Colors.blueGrey,
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
                      '$month\n',

                      const TextStyle(
                        color: white,
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
                      color: deepOrange
                  ),
                  bottom: BorderSide(
                      color: deepOrange
                  ),
                )),
            groupsSpace: 10,
            titlesData:FlTitlesData(
                show: true,
                leftTitles: AxisTitles(
                    axisNameWidget: Text(
                        metric.toUpperCase()
                    )
                ),
                bottomTitles: AxisTitles(
                    axisNameWidget: Text(
                        'MONTHS'
                    )
                )
            ) ,
            barGroups: barChartGroupData(myTrends,metric ,x)

        ));
  }
}

List<BarChartGroupData>? barChartGroupData (List<Trends> barData,String metric,Color color){
  List<BarChartGroupData> sections=[];
  int index=-1;
  for (Trends x in barData) {

    index++;
    late double metricValue;
    if (metric=='kwh'){
      metricValue=x.kwh;
    }
    else{
      metricValue=x.cost;
    }
    sections.add( BarChartGroupData(
      x:index,
      barRods: [
        BarChartRodData(
          fromY: 0,
          toY:metricValue,
          borderRadius: BorderRadius.zero,
          color: color,
          width: 16,
        ),

      ],
    ));
  }

  return sections;
}



class buildFloatingNavbar extends StatefulWidget {
  late int val;
  buildFloatingNavbar(this.val);
  @override
  State<buildFloatingNavbar> createState() => _buildFloatingNavbarState();
}

class _buildFloatingNavbarState extends State<buildFloatingNavbar> {
  @override
  Widget build(BuildContext context) {
    return FloatingNavbar(
padding: EdgeInsets.only(bottom: 0,top: 0),
      margin: EdgeInsets.only(bottom: 0, top: 0),
      backgroundColor: Colors.transparent,
      width: 180,
      onTap: (int index) {
        setState(() {
          widget.val=index;
        });
        if(widget.val==0){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>utility()));
        }
        else{
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>energy()));
        }
      },
      currentIndex: widget.val,

      items: [
        FloatingNavbarItem(icon: Icons.energy_savings_leaf_outlined, title: 'Load'),
        FloatingNavbarItem(icon: Icons.trending_up_sharp, title: 'Trends'),
      ],
    );
  }
}



