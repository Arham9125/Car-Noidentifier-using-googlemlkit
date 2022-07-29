import 'package:carapp/widgets/widgets.dart';
import 'package:flutter/material.dart';

detaling(String text, String text2) {
  return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
    Textwidget(
      text: text,
      fontsize: 30,
      colur: Colors.white,
    ),
    SizedBox(
      width: 20,
    ),
    Textwidget(
      text: text2,
      fontsize: 30,
      colur: Colors.white,
    ),
  ]);
}
