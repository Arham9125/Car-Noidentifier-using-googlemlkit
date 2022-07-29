import 'dart:ui';

import 'package:carapp/screens/screen3.dart';
import 'package:carapp/widgets/colors.dart';
import 'package:carapp/widgets/extra.dart';
import 'package:carapp/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Details extends StatelessWidget {
  List images = [
    ("assets/imagescar1.png"),
    ("assets/imagescar2.png"),
    ("assets/imagescar1.png"),
    ("assets/imagescar2.png"),
    ("assets/imagescar1.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainclr,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 400,
                width: 500,
                color: Color.fromARGB(255, 30, 30, 30),
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    detaling("VIN /Plate no:", "12345"),
                    SizedBox(
                      height: 20,
                    ),
                    detaling("Name", "Shohaib"),
                    SizedBox(
                      height: 20,
                    ),
                    detaling("Phone:", "+92772728298"),

                    //images //
                    SizedBox(
                      height: 40,
                    ),

                    Wrap(
                      direction: Axis.horizontal,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 220),
                              child: Textwidget(
                                text: "Add images:",
                                fontsize: 18,
                                colur: Colors.white,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  shape: BoxShape.circle),
                              child: Icon(
                                Icons.add,
                                color: Colors.blue,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Image.asset(
                          "assets/images/cars1.png",
                          height: 50,
                          width: 50,
                        ),
                        Image.asset(
                          "assets/images/cars1.png",
                          height: 50,
                          width: 50,
                        ),
                        Image.asset(
                          "assets/images/cars1.png",
                          height: 50,
                          width: 50,
                        ),
                        Image.asset(
                          "assets/images/cars1.png",
                          height: 50,
                          width: 50,
                        ),
                      ],
                    ),
                    // SizedBox(
                    //   height: 20,
                    // ),
                  ],
                  //images//
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
