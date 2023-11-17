import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:admin/homepage/Data/trends.dart';


class DatabaseHelper {
  Future openDatabase() async {
    join(await getDatabasesPath(), 'trends_database.db');

    onCreate:
        (db, version) {
      return db.execute(
        'CREATE TABLE trends(kwh REAL PRIMARY KEY ,month TEXT,cost REAL)',
      );
    };
    version:1;
  }

 Future<void> insertTrend(Trends trend) async {
   final Database db = await openDatabase();
   await db.insert(
'trends',
     trend.toMap(),
     conflictAlgorithm: ConflictAlgorithm.replace,
   );
 }

 Future<List<Trends>>  trend() async{
   final Database db = await openDatabase();
   final List <Map<String,dynamic>> maps = await db.query('trends');
   return List.generate(maps.length, (i){
     return Trends(
      maps[i]['id'] as double,
   maps[i]['name'] as String,
       maps[i]['age'] as double,
     );
   });
 }
  Future <void> deleteTrends(double kwh) async{
    final Database db = await openDatabase();
    await db.delete(
      'trends',

      where: 'kwh=?',
      whereArgs: [kwh],
    );

  }


}





