import 'package:Comm_type/common_weight/big_text.dart';
import 'package:Comm_type/constant/dimensions.dart';
import 'package:Comm_type/models/result_sheets.dart';
import 'package:Comm_type/screens/quiz_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [Color(0xff5376EE), Color(0xff10B1FA)],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          padding: EdgeInsets.all(Dimensions.width20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: Dimensions.height30 * 2),
                BigText(
                  text: "Behavioral Communication Styles",
                  color: Colors.white,
                  size: Dimensions.font16 * 3 / 2.1,
                ),
                SizedBox(height: Dimensions.height20),
                Image.asset(
                  'assets/images/result.png',
                  fit: BoxFit.contain,
                ),
                SizedBox(height: Dimensions.height30),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: Dimensions.width10),
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.width10,
                      vertical: Dimensions.height20),
                  height: Dimensions.height20 * 12,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(Dimensions.radius20)),
                  child: Column(
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        "Four Style of Commnication",
                        style: TextStyle(
                            fontSize: Dimensions.font20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: Dimensions.height20),
                      Text(
                        textAlign: TextAlign.center,
                        "After the analyze your answers you will get to know which is your style",
                        style: TextStyle(
                          fontSize: Dimensions.font20,
                        ),
                      ),
                      SizedBox(height: Dimensions.height20),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Dimensions.width20,
                                  vertical: Dimensions.height15),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.radius15))),
                          onPressed: () {
                            ResultSheetsApi.init();
                            Get.off(() => QuizScreen(),
                                transition: Transition.fadeIn);
                          },
                          child: Text(
                            "I Understand",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: Dimensions.font16),
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
