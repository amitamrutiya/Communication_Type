import 'package:Comm_type/common_weight/fade_in_animation/animation_design.dart';
import 'package:Comm_type/common_weight/fade_in_animation/fade_in_animation_controller.dart';
import 'package:Comm_type/common_weight/fade_in_animation/fade_in_animation_model.dart';
import 'package:Comm_type/constant/dimensions.dart';
import 'package:Comm_type/controller/splash_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  final splashController = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FadeInAnimationController());
    controller.startSplashAnimation();
    print(Dimensions.screenHeight);
    print(Dimensions.screenWidth);
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
        body: Stack(
          children: [
            FadeInAnimation(
              durationInMs: 2000,
              animate: AnimatePosition(
                topAfter: Dimensions.height30,
                topBefore: -Dimensions.height30,
                leftBefore: -Dimensions.width30,
                leftAfter: Dimensions.width10,
              ),
              child: Image(
                image: AssetImage('assets/images/top_splash_screen.png'),
                height: Dimensions.height45 * 3,
              ),
            ),
            FadeInAnimation(
              durationInMs: 2000,
              animate: AnimatePosition(
                  topBefore: Dimensions.height10 * 18,
                  topAfter: Dimensions.height10 * 18,
                  leftAfter: Dimensions.width20,
                  leftBefore: -Dimensions.width10 * 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Communication Type',
                    style: TextStyle(
                        fontSize: Dimensions.font16 * 2,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Know which type of communicater you are",
                    style: TextStyle(
                      fontSize: Dimensions.font20,
                      color: Color.fromARGB(255, 226, 226, 226),
                    ),
                  )
                ],
              ),
            ),
            FadeInAnimation(
              durationInMs: 2000,
              animate: AnimatePosition(
                  bottomBefore: Dimensions.height45,
                  bottomAfter: Dimensions.height20 * 6),
              child: Image(
                height: Dimensions.height10 * 50,
                width: Dimensions.height10 * 40,
                image: const AssetImage('assets/images/splash_image.png'),
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
