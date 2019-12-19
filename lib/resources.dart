import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Resources {
  static final _black = Color.fromRGBO(0x05, 0x07, 0x06, 1.0);
  static final _red = Color(0xff901a1d);
  static final _blue = Color(0xff0d77b1);
  static final _rust = Color(0xff884d37);
  static final _violet = Color(0xff7c3292);
  static final _green = Color(0xff08723f);
  static final _grey = Color(0xff4f4c3b);
  static final _orange = Color(0xffce944e);
  static final _yellow = Color(0xfff5cf4c);

  static final _blender = Color(0xff00e4ef);

  static final Map<int, Color> colorCodes = {
    50: Color.fromRGBO(_blender.red, _blender.green, _blender.blue, 0.1),
    100: Color.fromRGBO(_blender.red, _blender.green, _blender.blue, 0.2),
    200: Color.fromRGBO(_blender.red, _blender.green, _blender.blue, 0.3),
    300: Color.fromRGBO(_blender.red, _blender.green, _blender.blue, 0.4),
    400: Color.fromRGBO(_blender.red, _blender.green, _blender.blue, 0.5),
    500: Color.fromRGBO(_blender.red, _blender.green, _blender.blue, 0.6),
    600: Color.fromRGBO(_blender.red, _blender.green, _blender.blue, 0.7),
    700: Color.fromRGBO(_blender.red, _blender.green, _blender.blue, 0.8),
    800: Color.fromRGBO(_blender.red, _blender.green, _blender.blue, 0.9),
    900: Color.fromRGBO(_blender.red, _blender.green, _blender.blue, 1.0),
  };

  static final MaterialColor black = MaterialColor(_black.value, colorCodes);
  static final MaterialColor red = MaterialColor(_red.value, colorCodes);
  static final MaterialColor blue = MaterialColor(_blue.value, colorCodes);
  static final MaterialColor rust = MaterialColor(_rust.value, colorCodes);
  static final MaterialColor violet = MaterialColor(_violet.value, colorCodes);
  static final MaterialColor green = MaterialColor(_green.value, colorCodes);
  static final MaterialColor grey = MaterialColor(_grey.value, colorCodes);
  static final MaterialColor orange = MaterialColor(_orange.value, colorCodes);
  static final MaterialColor yellow = MaterialColor(_yellow.value, colorCodes);
}
