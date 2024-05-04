import 'package:Comm_type/common_weight/big_text.dart';
import 'package:Comm_type/constant/app_colors.dart';
import 'package:Comm_type/constant/dimensions.dart';
import 'package:Comm_type/controller/auth_controller.dart';
import 'package:Comm_type/screens/on_boarding_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  final AuthController authController =
      Get.put<AuthController>(AuthController());
  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                  backgroundColor: AppColors.primaryDarkColor),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: BigText(
                text: "Something Went Wrong",
                size: 30,
              ),
            );
          }
          if (snapshot.hasData) {
            return const OnBoardingScreen();
          } else {
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
                  body: SingleChildScrollView(
                      child: Container(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: Dimensions.height30 * 2),
                        Center(
                          child: Image(
                              image: const AssetImage(
                                  'assets/images/login_screen.png'),
                              height: Dimensions.screenHeight * 0.3),
                        ),
                        SizedBox(height: Dimensions.height45),
                        SizedBox(height: Dimensions.height10),
                        BigText(
                          text: "Login",
                          size: Dimensions.font20 * 2,
                          color: Colors.white,
                        ),
                        SizedBox(height: Dimensions.height10),
                        BigText(
                          text: "Login with Your Gmail Account",
                          size: Dimensions.font20,
                          color: Colors.white70,
                        ),
                        SizedBox(height: Dimensions.height30),
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton.icon(
                            style: OutlinedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.radius30))),
                            icon: const Image(
                                image:
                                    AssetImage('assets/images/google_logo.png'),
                                width: 20.0),
                            onPressed: () async {
                              await authController
                                  .googleLogin(context)
                                  .then((_) {
                                if (authController.hasError == true) {
                                  Get.closeAllSnackbars();
                                  Get.snackbar(
                                      "Answer",
                                      authController.errorCode!.value
                                          .toString(),
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
                                }
                              });
                            },
                            label: const Text(
                              "Log In With Google",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                        Center(
                          child: TextButton(
                              onPressed: () {
                                Get.off(() => const OnBoardingScreen(),
                                    transition: Transition.fadeIn);
                              },
                              child: const Text(
                                "Continue Without Sign In",
                                style: TextStyle(color: Colors.white70),
                              )),
                        )
                      ],
                    ),
                  ))),
            );
          }
        });
  }
}
