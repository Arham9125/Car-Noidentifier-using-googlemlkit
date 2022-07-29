import 'dart:io';

import 'package:carapp/main.dart';
import 'package:carapp/screens/details.dart';
import 'package:carapp/screens/loginscr.dart';
import 'package:carapp/widgets/colors.dart';
import 'package:carapp/widgets/extra.dart';
import 'package:carapp/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:flutter/src/foundation/key.dart';

import 'package:camera/camera.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:camera/camera.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:google_mlkit_commons/google_mlkit_commons.dart';
import 'package:image_picker/image_picker.dart';

class Camerascr extends StatefulWidget {
  @override
  State<Camerascr> createState() => _CamerascrState();
}

class _CamerascrState extends State<Camerascr> {
  String scannedtext = "";

  File? cropFile;

  PickedFile? _image;
  XFile? imageFile;
  XFile? image;
  bool textScanning = false;
  TextEditingController name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: mainclr,
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //gallery//
              SizedBox(
                height: 80,
              ),

              SingleChildScrollView(
                  child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: Center(
                                    child: Text("Input from cam/gallery")),
                                actions: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButton(
                                          onPressed: () {
                                            getimage(ImageSource.camera);
                                          },
                                          child: Text("camera")),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      ElevatedButton(
                                          onPressed: () {
                                            getgal(ImageSource.gallery);
                                          },
                                          child: Text("gallery")),
                                    ],
                                  )
                                ],
                              ));
                    },
                    child: Container(
                        height: 150,
                        width: 300,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade500,
                            border: Border.all(color: Colors.white, width: 1),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.deepPurpleAccent,
                                  spreadRadius: 1,
                                  blurRadius: 10)
                            ],
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 40),
                            child: Textwidget(
                              text: "  Capture from V/N",
                              fontsize: 50,
                            ),
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  //container two//
                  SingleChildScrollView(
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: Center(
                                      child: Text("Input from cam/gallery")),
                                  actions: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ElevatedButton(
                                            onPressed: () {
                                              getimage(ImageSource.camera);
                                            },
                                            child: Text("camera")),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        ElevatedButton(
                                            onPressed: () {
                                              getgal(ImageSource.gallery);
                                            },
                                            child: Text("gallery")),
                                      ],
                                    )
                                  ],
                                ));
                      },
                      child: Container(
                          height: 150,
                          width: 300,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade500,
                              border: Border.all(color: Colors.white, width: 1),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.deepPurpleAccent,
                                    spreadRadius: 1,
                                    blurRadius: 10)
                              ],
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Textwidget(
                                text: "  Capture from Number Plate",
                                fontsize: 40,
                              ),
                            ),
                          )),
                    ),
                  ),
                ],
              )),
              SizedBox(
                height: 20,
              ),

              if (textScanning) const CircularProgressIndicator(),

              if (cropFile != null)
                ElevatedButton(onPressed: () {}, child: Text("Crop")),

              if (!textScanning && imageFile == null)
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                          height: 100,
                          width: 200,
                          color: Colors.grey,
                          child: _image != null
                              ? Image.file(File(imageFile!.path))
                              : Container()),
                    ],
                  ),
                ),

              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future getreco(XFile image) async {
    final inputImage = InputImage.fromFilePath(image.path);
    final textdectector = GoogleMlKit.vision.textRecognizer();
    RecognizedText recognizedText =
        await textdectector.processImage(inputImage);
    await textdectector.close();
    scannedtext = "";
    for (TextBlock block in recognizedText.blocks) {
      for (TextLine line in block.lines) {
        scannedtext = scannedtext + line.text + "\n";
      }
    }
    // showModalBottomSheet(
    //     context: context,
    //     builder: (context) => Container(
    //           height: double.infinity,
    //           width: double.infinity,
    //           child: Textwidget(text: scannedtext, fontsize: 15),
    //         ));

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(scannedtext),
            actions: [
              Column(
                children: [
                  Textwidget(text: "Is it correct?", fontsize: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, submit());
                          },
                          child: Text("Yes")),
                      SizedBox(
                        width: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: Center(child: Text("Input Number")),
                                    actions: [
                                      Column(
                                        children: [
                                          TextField(
                                            controller: name,
                                            decoration: InputDecoration(
                                                filled: true,
                                                hintText:
                                                    "Enter your VIN/Number",
                                                fillColor: Colors.grey.shade200,
                                                border: OutlineInputBorder(
                                                    borderSide: BorderSide.none,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20))),
                                          ),
                                          ElevatedButton(
                                              onPressed: () {
                                                Navigator.pushNamed(
                                                    context, submit());
                                              },
                                              child: Text("Submit")),
                                        ],
                                      )
                                    ],
                                  ));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blue),
                          height: 40,
                          width: 70,
                          child: Center(
                              child: Textwidget(
                            text: "Manually",
                            colur: Colors.white,
                            fontsize: 15,
                          )),
                        ),
                      )
                    ],
                  ),
                  ElevatedButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: Center(
                                      child: Text("Input from cam/gallery")),
                                  actions: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ElevatedButton(
                                            onPressed: () {
                                              getimage(ImageSource.camera);
                                            },
                                            child: Text("camera")),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        ElevatedButton(
                                            onPressed: () {
                                              getgal(ImageSource.gallery);
                                            },
                                            child: Text("gallery")),
                                      ],
                                    )
                                  ],
                                ));
                      },
                      child: Text("Retake")),
                ],
              )
            ],
          );
        });
    setState(() {});
  }

  Future getimage(ImageSource source) async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      try {
        if (pickedImage != null) {
          textScanning = false;
          imageFile = pickedImage;
          setState(() {});
          getreco(pickedImage);
        } else {
          Icon(Icons.error);
        }
      } catch (e) {
        print(e);

        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Please try again"),
              );
            });
      }
    });
  }

  submit() {
    showModalBottomSheet(
        backgroundColor: Colors.grey.shade800,
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(10)),
                    height: 50,
                    width: 400,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Text("No:",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          name.text,
                          style: TextStyle(
                              color: Colors.red.shade600, fontSize: 26),
                        ),
                      ],
                    )),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  decoration: InputDecoration(
                      filled: true,
                      hintText: "Name",
                      fillColor: Colors.grey.shade200,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20))),
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  decoration: InputDecoration(
                      filled: true,
                      hintText: "Phone No:",
                      fillColor: Colors.grey.shade200,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20))),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  color: Colors.purple.shade300,
                  child: Row(children: [
                    SizedBox(
                      width: 20,
                    ),
                    Textwidget(
                      text: "Add",
                      fontsize: 20,
                      colur: Colors.white,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.add),
                      color: Colors.white,
                    ),
                  ]),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: Text("Submit"))
              ],
            ),
          );
        });
  }

  //crop//

  //  _cropimage() async {
  //   CroppedFile ? file = await ImageCropper().cropImage(sourcePath: PickedFile.path,

  //   aspectRatio: CropAspectRatio(ratioX: 1.0, ratioY: 1.0)
  //   );
  //   if(file != null){
  //     setState(() {
  //       cropFile =File(file.path);
  //     });
  //   }

  // }

  Future getgal(ImageSource source) async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedImage != null) {
        textScanning = false;
        imageFile = pickedImage;
        setState(() {});
        getreco(pickedImage);
      } else {
        Icon(Icons.error);
      }
    });
  }
}
