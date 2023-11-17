import 'package:flutter/material.dart';

import'package:flutter/material.dart';
import 'package:admin/homepage/widgets/widgets.dart';
import'package:admin/homepage/Constants/colorConsts/colors.dart';
class home extends StatelessWidget {
  int val=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(),
      bottomNavigationBar: buildFloatingNavbar(val),
    );
  }
}
