import 'package:flutter/material.dart';

abstract class Styles {
  Styles._();
  static const yellow = Color(0xffFBAE05);
  static const successGreen=Color(0xff04D440);
  static const blueDark=Color(0xff022964);
  static const black=Colors.black;
  static const primaryColor = Color(0xff033C67);
  static LinearGradient orange=const LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        Color(0x00FF960C),
        Color(0xffFFD166),
      ]
  );
  static LinearGradient blue=const LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        Color(0x00033C67),
        Color(0xff0D6AA7),
      ]
  );
  static const greyLight=Color(0xffF5F5F5);
  static const greyDark=Color(0xff8CA6B7);
  static const white=Color(0xffFFFFFF);
  static const background=Color(0xffF6F8FA);
  static const stroke=Color(0xffE4EFF3);
  static const primary=Color(0xff033C67);
  static const bg=Color(0xffE7F8FF);
  static const red=Color(0xffFF2E2E);



}