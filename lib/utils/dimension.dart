import 'package:flutter/material.dart';

// width = 411
// height = 681
class Dimension{
  static double screenHeight = 0.0;
  static double screenWidth = 0.0;
  static void init(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
  }
  static double height30 = screenHeight / 28.13;
  static double height300 = screenHeight/2.27;
  static double width300 = screenWidth/1.37;
  static double width600 = screenWidth/1.07;
  static double height200 = screenHeight/3.3;
  static double width200 = screenHeight/2.0;




}