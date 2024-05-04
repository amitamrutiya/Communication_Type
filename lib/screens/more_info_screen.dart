import 'package:Comm_type/common_weight/big_text.dart';
import 'package:Comm_type/constant/app_colors.dart';
import 'package:Comm_type/constant/dimensions.dart';
import 'package:Comm_type/data.dart';
import 'package:flutter/material.dart';

class MoreInfoScreen extends StatelessWidget {
  const MoreInfoScreen({Key? key}) : super(key: key);

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
          padding: EdgeInsets.all(Dimensions.width10),
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
                BigText(
                  text: 'Traits of a Relater',
                  color: Colors.white,
                ),
                SizedBox(height: Dimensions.height10),
                Container(
                  height: Dimensions.height10 * 30,
                  width: Dimensions.width10 * 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: AppColors.primaryLightColor),
                  child: ListView.builder(
                      itemBuilder: ((context, index) {
                        return Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.width20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                textAlign: TextAlign.center,
                                RelaterTraits[index],
                                style: TextStyle(
                                    color: AppColors.primaryTextColor,
                                    fontSize: Dimensions.font16),
                              ),
                              const Divider(
                                thickness: 1,
                              ),
                            ],
                          ),
                        );
                      }),
                      itemCount: RelaterTraits.length),
                ),
                SizedBox(height: Dimensions.height20),
                BigText(
                  text: 'Traits of a Socializer',
                  color: Colors.white,
                ),
                SizedBox(height: Dimensions.height10),
                Container(
                  height: Dimensions.height10 * 30,
                  width: Dimensions.width10 * 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: AppColors.primaryLightColor),
                  child: ListView.builder(
                      itemBuilder: ((context, index) {
                        return Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.width20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                textAlign: TextAlign.center,
                                SocializerTraits[index],
                                style: TextStyle(
                                    color: AppColors.primaryTextColor,
                                    fontSize: Dimensions.font16),
                              ),
                              const Divider(
                                thickness: 1,
                              ),
                            ],
                          ),
                        );
                      }),
                      itemCount: SocializerTraits.length),
                ),
                SizedBox(height: Dimensions.height20),
                BigText(
                  text: 'Traits of a Thinker',
                  color: Colors.white,
                ),
                SizedBox(height: Dimensions.height10),
                Container(
                  height: Dimensions.height10 * 30,
                  width: Dimensions.width10 * 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: AppColors.primaryLightColor),
                  child: ListView.builder(
                      itemBuilder: ((context, index) {
                        return Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.width20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                textAlign: TextAlign.center,
                                ThinkerTraits[index],
                                style: TextStyle(
                                    color: AppColors.primaryTextColor,
                                    fontSize: Dimensions.font16),
                              ),
                              const Divider(
                                thickness: 1,
                              ),
                            ],
                          ),
                        );
                      }),
                      itemCount: ThinkerTraits.length),
                ),
                SizedBox(height: Dimensions.height20),
                BigText(
                  text: 'Traits of a Director',
                  color: Colors.white,
                ),
                SizedBox(height: Dimensions.height10),
                Container(
                  height: Dimensions.height10 * 30,
                  width: Dimensions.width10 * 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: AppColors.primaryLightColor),
                  child: ListView.builder(
                      itemBuilder: ((context, index) {
                        return Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.width20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                textAlign: TextAlign.center,
                                DirectorTraits[index],
                                style: TextStyle(
                                    color: AppColors.primaryTextColor,
                                    fontSize: Dimensions.font16),
                              ),
                              const Divider(
                                thickness: 1,
                              ),
                            ],
                          ),
                        );
                      }),
                      itemCount: DirectorTraits.length),
                ),
                SizedBox(height: Dimensions.height20),

                // Text(
                //   textAlign: TextAlign.center,
                //   "Communicate with others the way they want to be communicated with",
                //   style:
                //       TextStyle(fontSize: Dimensions.font20, color: Colors.white),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
