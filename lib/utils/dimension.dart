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
  static double height15 = screenHeight / 45.4;
  static double height20 = screenHeight / 34.05;
  static double height10 = screenHeight / 68.1;
  static double height4 = screenHeight / 170.25;
  static double height8 = screenHeight / 85.125;
  static double height80 = screenHeight / 8.5125;

  static double height40 = screenHeight / 17.025;
  static double height300 = screenHeight/2.27;
  static double height200 = screenHeight/3.3;
  static double height250 = screenHeight/2.724;
  static double height260 = screenHeight/2.62;
  static double height220 = screenHeight/3.1;
  static double height100 = screenHeight / 6.81;



  static double height50 = screenHeight / 13.62;
  static double height70 = screenHeight / 9.73;
  static double height60 = screenHeight / 11.35;






  static double width300 = screenWidth/1.37;
  static double width600 = screenWidth/1.07;
  static double width60 = screenWidth/6.85;
  static double width200 = screenWidth/2.0;
  static double width40 = screenWidth/10.275;
  static double width80 = screenWidth/5.1375;
  static double width20 = screenWidth/20.5;
  static double width15 = screenWidth/27.4;
  static double width10 = screenWidth/41.1;
  static double width70 = screenWidth/5.87;
  static double width50 = screenWidth/8.22;





  static double font30 = screenHeight / 22.7;
  static double font16 = screenHeight / 42.5624;
  static double font14 = screenHeight / 48.64;
  static double font70 = screenHeight / 9.73;
  static double font60 = screenHeight / 11.35;
  static double font40 = screenHeight / 17.025;
  static double font20 = screenHeight / 34.5;
  static double font24 = screenHeight / 28.375;
  static double font18 = screenHeight / 37.83;







}