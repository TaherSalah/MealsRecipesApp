import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppStyle{
  static  appStyle(double size,Color color,FontWeight fw){
    TextStyle textStyleApp=GoogleFonts.cairo(
      color: color,fontSize: size,fontWeight: fw,
    );
  }

}