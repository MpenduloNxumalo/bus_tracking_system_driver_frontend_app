import 'dart:ui';

import 'package:flutter/cupertino.dart';

String font = "Itim-Regular";
Widget hintText(String s) => Text(s,
  style: TextStyle(fontFamily: font, color: primaryColor),
);
Color primaryColor = const Color.fromRGBO(0, 56, 91, 1);
Color secondaryColor = const Color.fromRGBO(85, 161, 237, 1);
Color tertiaryColor = const Color.fromRGBO(45, 55, 72, 1);
