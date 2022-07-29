import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class Textwidget extends StatelessWidget {
  String text;
  dynamic colur;
  double fontsize;
  dynamic fontweight;

  Textwidget(
      {required this.text,
      this.colur,
      required this.fontsize,
      this.fontweight});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.acme(
            textStyle: TextStyle(
                color: colur, fontSize: fontsize, fontWeight: fontweight)));
  }
}


////login////

