import 'package:flutter/material.dart';

class CustomTextStyle {
  static const double defaultSize = 16;
  static const FontWeight defaultFontWeight = FontWeight.normal;
  static const String defaultFontFamily = 'Lato';


  static TextStyle textStyle({
    double? size,
    FontWeight? fontWeight,
    String? fontFamily,
  }) {
    return TextStyle(
      fontSize: size ?? defaultSize,
      fontWeight: fontWeight ?? defaultFontWeight,
      fontFamily: fontFamily ?? defaultFontFamily,
      
    );
  }
}