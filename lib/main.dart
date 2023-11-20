import 'package:flutter/material.dart';
import 'homepage/loadpages/utility.dart';
import 'homepage/home.dart';
import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:provider/provider.dart';
import 'package:admin/homepage/energy consumption/providerLogic.dart';

void main () async{
  WidgetsFlutterBinding.ensureInitialized();

  return runApp(
      const admin()
  ) ;
}
class admin extends StatelessWidget {
  const admin({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Data()),
      ],
      child: MaterialApp(
      title: 'Admin EMS ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        primaryColor:Colors.orangeAccent,
        /*
        colorScheme:  ColorScheme.dark(
          background: Color(0xFF330985),
        ),
        */


      ),
      home:utility() ,
    )
    );
  }
}
