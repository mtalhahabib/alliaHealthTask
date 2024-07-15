import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UiHelper {
  Widget textW({
    required String text,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    String? fontName,
    int? maxLines,
    TextAlign? textAlign,
  }) {
    return Text(
      
      text,
      
      softWrap: true,
      style: TextStyle(
          
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        overflow: TextOverflow.visible,
      ),
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }

  Widget dividerW(color, width, height) {
    return Container(
      height: height,
      width: width,
      color: color,
    );
  }

  sizedHeightW(height) {
    return SizedBox(
      height: height.toDouble(),
    );
  }

  sizedWidthW(width) {
    return SizedBox(
      width: width.toDouble(),
    );
  }

  iconW(IconData icon, color, size) {
    return Icon(
      icon,
      color: color,
      size: size,
    );
  }

  containerW(height,width, color, borderRadius,borderColor,child) {
    return Container(
      height: height.toDouble(),
      width:width.toDouble(),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
          color: color, borderRadius: BorderRadius.circular(borderRadius.toDouble())),
    child: child,
    );
    
  }
}
