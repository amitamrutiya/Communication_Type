import 'package:Comm_type/common_weight/big_text.dart';
import 'package:Comm_type/constant/app_colors.dart';
import 'package:Comm_type/constant/dimensions.dart';
import 'package:Comm_type/controller/auth_controller.dart';
import 'package:Comm_type/data.dart';
import 'package:Comm_type/screens/animation_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> with TickerProviderStateMixin {
  double? _scale1;
  double? _scale2;
  late AnimationController bouncingController1;
  late AnimationController bouncingController2;

  bool? onTap1;
  int questionIndex = 0;
  bool? onTap2;

  int countofO = 0;
  int countofG = 0;
  int countofD = 0;
  int countofI = 0;
  String? userType;
  @override
  void initState() {
    bouncingController1 = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 60,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
    bouncingController2 = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 60,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    bouncingController1.dispose();
    bouncingController2.dispose();
    super.dispose();
  }

  void _tapDown1(TapDownDetails details) {
    bouncingController1.forward();
  }

  void _tapDown2(TapDownDetails details) {
    bouncingController2.forward();
  }

  void _tapUp1(TapUpDetails details) {
    bouncingController1.reverse();
  }

  void _tapUp2(TapUpDetails details) {
    bouncingController2.reverse();
  }

  final AuthController authController =
      Get.put<AuthController>(AuthController());
  @override
  Widget build(BuildContext context) {
    _scale1 = 1 - bouncingController1.value;
    _scale2 = 1 - bouncingController2.value;
    onTap1 = question[questionIndex]['answer_a'];
    onTap2 = question[questionIndex]['answer_b'];

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Color(0xff5376EE), Color(0xff10B1FA)])),
        padding: EdgeInsets.symmetric(horizontal: Dimensions.width15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: Dimensions.height45),
            FirebaseAuth.instance.currentUser == null
                ? const Text("")
                : Text(
                    "🙋‍♂️Hey, ${FirebaseAuth.instance.currentUser!.displayName.toString()}",
                    style: TextStyle(
                        fontSize: Dimensions.font20, color: Colors.white),
                  ),
            Center(
              child: SizedBox(
                height: Dimensions.height30 * 8,
                width: Dimensions.width30 * 9,
                child: Image.asset(
                  question[questionIndex]['image'],
                  fit: BoxFit.cover,
                ),
              ),
            ),
          Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    'Question ${questionIndex + 1}/18',
                    style: TextStyle(
                        color: Colors.white, fontSize: Dimensions.font16 * 2),
                  ),
                ),
                SizedBox(
                  height: Dimensions.height20,
                ),
                Transform.scale(
                  scale: _scale1,
                  child: Container(
                    decoration: onTap1 == false
                        ? BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius20 / 2),
                            color: Colors.white)
                        : BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius20 / 2),
                            gradient: const LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Color(0xffC4C306),
                                  Color.fromARGB(255, 247, 231, 84)
                                ])),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTapUp: _tapUp1,
                        onTapDown: _tapDown1,
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20 / 2),
                        splashColor: onTap1 == false
                            ? const Color(0xffC4C306)
                            : Colors.white,
                        onTap: () {
                          question[questionIndex]['answer_b'] = false;
                          question[questionIndex]['answer_a'] = !onTap1!;
                          setState(() {
                            onTap1 = !(onTap1!);
                            if (onTap2 == true) onTap2 = false;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.width10,
                              vertical: Dimensions.width10),
                          child: Text(
                            question[questionIndex]['question_a'],
                            style: TextStyle(
                                color: AppColors.primaryTextColor,
                                fontSize: Dimensions.font26),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: Dimensions.height20,
                ),
                Transform.scale(
                  scale: _scale2,
                  child: Container(
                    decoration: onTap2 == false
                        ? BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius20 / 2),
                            color: Colors.white)
                        : BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius20 / 2),
                            gradient: const LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Color(0xffC4C306),
                                  Color.fromARGB(255, 247, 231, 84)
                                ])),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTapDown: _tapDown2,
                        onTapUp: _tapUp2,
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20 / 2),
                        splashColor: onTap2 == false
                            ? const Color(0xffC4C306)
                            : Colors.white,
                        onTap: () {
                          question[questionIndex]['answer_a'] = false;
                          question[questionIndex]['answer_b'] = !onTap2!;
                          setState(() {
                            onTap2 = !(onTap2!);
                            if (onTap1 == true) onTap1 = false;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.width10,
                              vertical: Dimensions.width10),
                          child: Text(
                            question[questionIndex]['question_b'],
                            style: TextStyle(
                                color: AppColors.primaryTextColor,
                                fontSize: Dimensions.font26),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: Dimensions.height20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      borderRadius:
                          BorderRadius.circular(Dimensions.radius15 * 2),
                      onTap: () {
                        if (questionIndex == 0) {
                          null;
                        } else {
                          setState(() {
                            questionIndex--;
                          });
                        }
                      },
                      child: Container(
                        height: Dimensions.height30 * 2,
                        width: Dimensions.width30 * 2,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius15 * 2),
                            color: Colors.white),
                        child: Center(
                            child: Icon(
                          Icons.arrow_back_rounded,
                          size: Dimensions.iconSize16 * 2,
                          color: questionIndex == 0
                              ? Theme.of(context).disabledColor
                              : AppColors.primaryTextColor,
                        )),
                      ),
                    ),
                    SizedBox(width: Dimensions.width45),
                    InkWell(
                      borderRadius:
                          BorderRadius.circular(Dimensions.radius15 * 2),
                      onTap: () {
                        if (questionIndex == 17) {
                          null;
                        } else if (onTap1 == false && onTap2 == false) {
                          Get.closeAllSnackbars();
                          Get.snackbar(
                              "Answer", "Please Selecte Any One Option",
                              icon: Icon(
                                Icons.dangerous_rounded,
                                size: Dimensions.iconSize16 * 2,
                              ),
                              titleText: Text(
                                "Answer",
                                style: TextStyle(
                                    fontSize: Dimensions.font20,
                                    fontWeight: FontWeight.bold,
                                    fontFamily:
                                        'assets/fonts/SourceSansPro-Bold'),
                              ),
                              messageText: Text(
                                "Please Selecte Any One Option",
                                style: TextStyle(fontSize: Dimensions.font16),
                              ),
                              backgroundColor: Colors.red,
                              backgroundGradient: const LinearGradient(colors: [
                                Color(0xffED6F9E),
                                Color(0xffEC8B6A)
                              ]));
                        } else {
                          setState(() {
                            questionIndex++;
                          });
                        }
                      },
                      child: Container(
                        height: Dimensions.height30 * 2,
                        width: Dimensions.width30 * 2,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius15 * 2),
                            color: Colors.white),
                        child: Center(
                            child: Icon(
                          Icons.arrow_forward_rounded,
                          size: Dimensions.iconSize16 * 2,
                          color: questionIndex == 17
                              ? Theme.of(context).disabledColor
                              : AppColors.primaryTextColor,
                        )),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: Dimensions.height20,
                ),
                questionIndex == 17
                    ? Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius20),
                            gradient: const LinearGradient(colors: [
                              Color(0xffED6F9E),
                              Color(0xffEC8B6A)
                            ])),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            splashColor: Colors.red,
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius20),
                            onTap: () {
                              if (onTap1 == false && onTap2 == false) {
                                Get.closeAllSnackbars();
                                Get.snackbar(
                                    "Answer", "Please Selecte Any One Option",
                                    icon: Icon(
                                      Icons.dangerous_rounded,
                                      size: Dimensions.iconSize16 * 2,
                                    ),
                                    titleText: Text(
                                      "Answer",
                                      style: TextStyle(
                                          fontSize: Dimensions.font20,
                                          fontWeight: FontWeight.bold,
                                          fontFamily:
                                              'assets/fonts/SourceSansPro-Bold'),
                                    ),
                                    messageText: Text(
                                      "Please Selecte Any One Option",
                                      style: TextStyle(
                                          fontSize: Dimensions.font16),
                                    ),
                                    backgroundColor: Colors.red,
                                    backgroundGradient: const LinearGradient(
                                        colors: [
                                          Color(0xffED6F9E),
                                          Color(0xffEC8B6A)
                                        ]));
                              } else {
                                showAlertDialog2(context);
                                if (FirebaseAuth.instance.currentUser == null) {
                                  showAlertDialog1(context);
                                }
                              }
                            },
                            child: SizedBox(
                              width: Dimensions.height10 * 20,
                              height: Dimensions.width10 * 5,
                              child: Center(
                                child: Text(
                                  "Submit",
                                  style: TextStyle(
                                      fontSize: Dimensions.font26,
                                      color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  showAlertDialog1(BuildContext context) {
    Widget cancleButton = TextButton(
      child: const Text("NO"),
      onPressed: () {
        Get.back();
        FirebaseAuth.instance.signOut();
      },
    );
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimensions.radius20),
      ),
      backgroundColor: AppColors.primaryLightColor,
      elevation: 0,
      title: BigText(text: "Login With Google"),
      content: const Text(
        "If you want your result through mail than login with Gmail account",
      ),
      actions: [
        Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius15))),
                icon: const Image(
                    image: AssetImage('assets/images/google_logo.png'),
                    width: 20.0),
                onPressed: () async {
                  await authController.googleLogin(context).then((_) {
                    if (authController.hasError == true) {
                      Get.closeAllSnackbars();
                      Get.snackbar("Attention",
                          authController.errorCode!.value.toString(),
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
                            authController.errorCode!.value.toString(),
                            style: TextStyle(fontSize: Dimensions.font16),
                          ),
                          backgroundColor: Colors.red,
                          backgroundGradient: const LinearGradient(
                              colors: [Color(0xffED6F9E), Color(0xffEC8B6A)]));
                    } else if (FirebaseAuth.instance.currentUser != null) {
                      Get.back();
                    } else {
                      print("Else Block");
                    }
                  });
                },
                label: const Text(
                  "Log In With Google",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            cancleButton,
          ],
        )
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showAlertDialog2(BuildContext context) {
    Widget yesButton = TextButton(
      child: const Text("YES"),
      onPressed: () {
        countofD = 0;
        countofG = 0;
        countofI = 0;
        countofO = 0;
        if (onTap1 == false && onTap2 == false) {
          Get.closeAllSnackbars();
          Get.snackbar("Answer", "Please Selecte Any One Option",
              icon: Icon(
                Icons.dangerous_rounded,
                size: Dimensions.iconSize16 * 2,
              ),
              titleText: Text(
                "Answer",
                style: TextStyle(
                    fontSize: Dimensions.font20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'assets/fonts/SourceSansPro-Bold'),
              ),
              messageText: Text(
                "Please Selecte Any One Option",
                style: TextStyle(fontSize: Dimensions.font16),
              ),
              backgroundColor: Colors.red,
              backgroundGradient: const LinearGradient(
                  colors: [Color(0xffED6F9E), Color(0xffEC8B6A)]));
        }
        for (var i = 0; i < question.length; i++) {
          if (((i + 1) % 2 == 1 &&
                  question[i]['answer_a'] == true &&
                  [1, 5, 9, 13, 17].contains(i + 1)) ||
              ((i + 1) % 2 == 1 &&
                  question[i]['answer_b'] == true &&
                  [3, 7, 11, 15].contains(i + 1))) {
            countofO++;
          } else if (((i + 1) % 2 == 1 &&
                  question[i]['answer_b'] == true &&
                  [1, 5, 9, 13, 17].contains(i + 1)) ||
              ((i + 1) % 2 == 1 &&
                  question[i]['answer_a'] == true &&
                  [3, 7, 11, 15].contains(i + 1))) {
            countofG++;
          } else if (((i + 1) % 2 == 0 &&
                  question[i]['answer_a'] == true &&
                  [2, 6, 10, 14, 18].contains(i + 1)) ||
              ((i + 1) % 2 == 0 &&
                  question[i]['answer_b'] == true &&
                  [4, 8, 12, 16].contains(i + 1))) {
            countofI++;
          } else if (((i + 1) % 2 == 0 &&
                  question[i]['answer_b'] == true &&
                  [2, 4, 10, 14, 18].contains(i + 1)) ||
              ((i + 1) % 2 == 0 &&
                  question[i]['answer_a'] == true &&
                  [4, 8, 12, 16].contains(i + 1))) {
            countofD++;
          }
        }
        List<int> list = [];
        list = [
          countofO + countofI,
          countofO + countofD,
          countofG + countofI,
          countofG + countofD
        ];
        int maxIndex = 0;
        int curr = 0;
        for (var i = 0; i < list.length; i++) {
          if (list[i] > curr) {
            curr = list[i];
            maxIndex = i;
          }
        }
        if (maxIndex == 0) {
          userType = 'Relater';
        } else if (maxIndex == 1) {
          userType = 'Socializer';
        } else if (maxIndex == 2) {
          userType = 'Thinker';
        } else if (maxIndex == 3) {
          userType = 'Director';
        }

        print(
            "O : $countofO || G : $countofG || I : $countofI || D : $countofD");
        Get.back();
        Get.to(() => AnimationScreen(userType: userType!));
        userResult();
      },
    );
    Widget noButton = TextButton(
      child: const Text("NO"),
      onPressed: () {
        Get.back();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimensions.radius20),
      ),
      backgroundColor: AppColors.primaryLightColor,
      elevation: 0,
      title: BigText(text: "Are You Sure?"),
      content: const Text(
        "Do You Want To Submit This Quiz?",
      ),
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      actions: [
        noButton,
        yesButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void userResult() {
    String value = "";
    for (int i = 0; i < question.length; i++) {
      if (question[i]['answer_a']) {
        value = "A";
      } else {
        value = "B";
      }
      UserAnswers.addAll({i + 1: value});
    }
    print(UserAnswers.toString().replaceAll('{', '').replaceAll('}', ''));
  }
}
