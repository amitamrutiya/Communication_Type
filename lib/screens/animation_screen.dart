import 'dart:async';
import 'dart:convert';

import 'dart:math';
import 'package:Comm_type/data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Comm_type/constant/dimensions.dart';
import 'package:Comm_type/models/result.dart';
import 'package:Comm_type/models/result_sheets.dart';
import 'package:Comm_type/screens/result_screen.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class AnimationScreen extends StatefulWidget {
  final String userType;

  const AnimationScreen({super.key, required this.userType});
  @override
  _AnimationScreenState createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen>
    with TickerProviderStateMixin {
  late AnimationController firstController;
  late Animation<double> firstAnimation;

  late AnimationController secondController;
  late Animation<double> secondAnimation;

  late AnimationController thirdController;
  late Animation<double> thirdAnimation;

  late AnimationController fourthController;
  late Animation<double> fourthAnimation;

  late AnimationController fifthController;
  late Animation<double> fifthAnimation;

  void updateSpreedSheet(String email, String name, String time) async {
  
    final result = {
      ResultFields.studentID: email,
      ResultFields.studentName: name,
      ResultFields.studentType: widget.userType,
      ResultFields.submitTime: time,
      ResultFields.answer: UserAnswers.toString().replaceAll('{', '').replaceAll('}', '')
    };
    if (await ResultSheetsApi.update(result) == false) {
      await ResultSheetsApi.insert(result);
    }
  }

  Future sendMail(String email, String name) async {
    if (ConnectivityResult.none == await Connectivity().checkConnectivity()) {
      return;
    }
    final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
    final response = await http.post(
      url,
      headers: {'Content-type': 'application/json'},
      body: json.encode(
        {
          'service_id': 'service_zoc8fow',
          'template_id': "template_8ld4sgf",
          'user_id': "hqoRY3FK13X6Hu7oW",
          'template_params': {
            'to_email': '$email',
            'to_name': '$name',
            'result': widget.userType,
          }
        },
      ),
    );
    return response;
  }

  Future addResultToDatabase(String name, String email) async {
    if (ConnectivityResult.none != await Connectivity().checkConnectivity()) {
      String time = DateFormat('dd-MM-yyyy hh:mm a').format(DateTime.now());
      ResultModel resultModel = ResultModel(
        submitTime: time,
        studentID: email,
        studentName: name,
        result: widget.userType,
        answer: UserAnswers.toString().replaceAll('{', '').replaceAll('}', ''),
      );
      return FirebaseFirestore.instance
          .collection('result')
          .add(resultModel.toJson())
          .then((_) async {
        // sendMail(email, name);
        updateSpreedSheet(email, name, time);
        Get.snackbar(
            // borderColor: AppColors.mainColor,
            "All went well",
            "We got your information");
      }).catchError((error) {
        Get.closeAllSnackbars();
        Get.snackbar("Attention", "Retry! An Error Occured ",
            icon: Icon(
              Icons.dangerous_rounded,
              size: Dimensions.iconSize16 * 2,
            ),
            titleText: Text(
              "Attention",
              style: TextStyle(
                  fontSize: Dimensions.font20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'assets/fonts/SourceSansPro-Bold'),
            ),
            messageText: Text(
              "Retry! An Error Occured ",
              style: TextStyle(fontSize: Dimensions.font16),
            ),
            backgroundColor: Colors.red,
            backgroundGradient: const LinearGradient(
                colors: [Color(0xffED6F9E), Color(0xffEC8B6A)]));
      });
    }
    return;
  }

  @override
  void initState() {
    if (FirebaseAuth.instance.currentUser != null) {
      var name = FirebaseAuth.instance.currentUser!.displayName;
      var email = FirebaseAuth.instance.currentUser!.email;
      addResultToDatabase(name!, email!);
    }

    super.initState();

    firstController =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
    firstAnimation = Tween<double>(begin: -pi, end: pi).animate(firstController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          firstController.repeat();
        } else if (status == AnimationStatus.dismissed) {
          firstController.forward();
        }
      });

    secondController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    secondAnimation =
        Tween<double>(begin: -pi, end: pi).animate(secondController)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              secondController.repeat();
            } else if (status == AnimationStatus.dismissed) {
              secondController.forward();
            }
          });

    thirdController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    thirdAnimation = Tween<double>(begin: -pi, end: pi).animate(thirdController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          thirdController.repeat();
        } else if (status == AnimationStatus.dismissed) {
          thirdController.forward();
        }
      });

    fourthController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    fourthAnimation =
        Tween<double>(begin: -pi, end: pi).animate(fourthController)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              fourthController.repeat();
            } else if (status == AnimationStatus.dismissed) {
              fourthController.forward();
            }
          });

    fifthController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    fifthAnimation = Tween<double>(begin: -pi, end: pi).animate(fifthController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          fifthController.repeat();
        } else if (status == AnimationStatus.dismissed) {
          fifthController.forward();
        }
      });

    firstController.forward();
    secondController.forward();
    thirdController.forward();
    fourthController.forward();
    fifthController.forward();
  }

  @override
  void dispose() {
    firstController.dispose();
    secondController.dispose();
    thirdController.dispose();
    fourthController.dispose();
    fifthController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Timer(
        const Duration(seconds: 5),
        () => Get.off(() => ResultScreen(result: widget.userType),
            transition: Transition.circularReveal));
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Color(0xff5376EE), Color(0xff10B1FA)])),
        child: Center(
          child: SizedBox(
            height: 100,
            width: 100,
            child: CustomPaint(
              painter: MyPainter(
                firstAnimation.value,
                secondAnimation.value,
                thirdAnimation.value,
                fourthAnimation.value,
                fifthAnimation.value,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  final double firstAngle;
  final double secondAngle;
  final double thirdAngle;
  final double fourthAngle;
  final double fifthAngle;

  MyPainter(
    this.firstAngle,
    this.secondAngle,
    this.thirdAngle,
    this.fourthAngle,
    this.fifthAngle,
  );

  @override
  void paint(Canvas canvas, Size size) {
    Paint myArc = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromLTRB(
        0,
        0,
        size.width,
        size.height,
      ),
      firstAngle,
      2,
      false,
      myArc,
    );
    canvas.drawArc(
      Rect.fromLTRB(
        size.width * .1,
        size.height * .1,
        size.width * .9,
        size.height * .9,
      ),
      secondAngle,
      2,
      false,
      myArc,
    );
    canvas.drawArc(
      Rect.fromLTRB(
        size.width * .2,
        size.height * .2,
        size.width * .8,
        size.height * .8,
      ),
      thirdAngle,
      2,
      false,
      myArc,
    );
    canvas.drawArc(
      Rect.fromLTRB(
        size.width * .3,
        size.height * .3,
        size.width * .7,
        size.height * .7,
      ),
      fourthAngle,
      2,
      false,
      myArc,
    );
    canvas.drawArc(
      Rect.fromLTRB(
        size.width * .4,
        size.height * .4,
        size.width * .6,
        size.height * .6,
      ),
      fifthAngle,
      2,
      false,
      myArc,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
