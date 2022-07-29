import 'package:carapp/screens/screen3.dart';
import 'package:carapp/screens/details.dart';
import 'package:carapp/widgets/colors.dart';
import 'package:carapp/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String pass = "abc";
  String pass2 = "123";

  final password = TextEditingController();

  //for password//
  Sharedset() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("Password", password.text);
  }

  sharedget() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.getString("Password");
    LoginFunc();
  }

  //dunction for login//
  LoginFunc() {
    if (password.text == pass) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Details()));
    } else {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Center(
                child: Textwidget(
                  text: "Add-User",
                  fontsize: 30,
                ),
              ),
              elevation: 20,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              actions: [
                Center(
                  child: IconButton(
                      color: Colors.red,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Camerascr()));
                      },
                      icon: Icon(Icons.add)),
                )
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 15, 15, 15),
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 80,
              ),
              Text(
                "Hello",
                style: GoogleFonts.mochiyPopOne(
                    textStyle:
                        TextStyle(color: Colors.white, fontSize: 80, shadows: [
                  Shadow(
                      color: Colors.black, blurRadius: 10, offset: Offset.zero),
                  Shadow(
                      color: Colors.yellow, blurRadius: 5, offset: Offset.zero)
                ])),
              ),
              SizedBox(
                height: 50,
              ),
              Center(
                child: Card(
                  elevation: 20,
                  color: mainclr,
                  shadowColor: Colors.black12,
                  shape: RoundedRectangleBorder(
                    side: BorderSide.none,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 80,
                      ),

                      //textfield//
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: TextField(
                            controller: password,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                labelText: "Enter your User Id",
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10)))),
                      ),
                      SizedBox(
                        height: 80,
                      ),

                      //button//
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  LoginFunc();
                },
                child: Container(
                  height: 80,
                  width: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(color: Colors.white, blurRadius: 5)
                      ],
                      border:
                          Border.all(color: Colors.blue.shade800, width: 1)),
                  child: Center(
                    child: Textwidget(
                      text: "Submit",
                      fontsize: 30,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Image.asset(
                "assets/images/gif.gif",
                height: 80,
                width: 200,
              )
            ],
          ),
        ),
      ),
    );
  }
}
