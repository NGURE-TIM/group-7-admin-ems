import 'package:flutter/material.dart';
import 'package:admin/homepage/Data/utilities.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:admin/homepage/loadpages/load.dart';
import'package:admin/homepage/Constants/colorConsts/colors.dart';
import 'package:admin/homepage/energy consumption/energy.dart';
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
      aspectRatio: 1.3,
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
      final radius = isTouched ? 130.0 : 100.0;
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
        titlePositionPercentageOffset: 1.1
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
          decoration:const BoxDecoration(
              color: black
          ),
          child:ListView.builder(itemCount: data.length,
            itemBuilder:(context,index){
              Utility item=data[index];
              return Column(

                children: [

                  InkWell(
                    splashColor: Colors.white,
                    hoverColor: Colors.cyan,
                    focusColor: white,
                    onTap:(){
                      //Navigator.of(context).push(MaterialPageRoute(builder: (context) => Load(item.utility,item.quantity,item.rating,item.hours,item.imagepath)));

Navigator.of(context).push(MaterialPageRoute(builder: (context)=>energy()));
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
                          fontSize:10,
                        ),
                      ),
                      trailing: Text(
                        item.kw.toString(),
                        style: const TextStyle(
                          fontSize:10,
                        ),
                      ),
                    ),
                  ),
                  const Divider(
                    color: dividerColor,
                  )
                ],
              );

            },
          )
      ),
    ),
  );
}

buildRows (String x , double y){
  return  Row(
    children: [
      Text(
        x,
        style: const TextStyle(
            color: black,
            fontWeight: FontWeight.bold
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
  );

}