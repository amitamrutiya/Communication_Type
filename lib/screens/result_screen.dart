import 'package:Comm_type/common_weight/big_text.dart';
import 'package:Comm_type/constant/app_colors.dart';
import 'package:Comm_type/constant/dimensions.dart';
import 'package:Comm_type/data.dart';
import 'package:Comm_type/screens/more_info_screen.dart';
import 'package:Comm_type/screens/quiz_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultScreen extends StatefulWidget {
  final String result;
  const ResultScreen({Key? key, required this.result}) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
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
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(Dimensions.width20),
            child: Column(
              children: [
                SizedBox(height: Dimensions.height45),
                BigText(
                  text: "Your Style",
                  color: Colors.white,
                  size: Dimensions.font26,
                ),
                SizedBox(height: Dimensions.height20),
                widget.result == 'Relater'
                    ? RelaterCard()
                    : widget.result == "Socializer"
                        ? SocializerCard()
                        : widget.result == 'Thinker'
                            ? ThinkerCard()
                            : DirectorCard(),
                SizedBox(height: Dimensions.height20),
                BigText(
                  text: 'Traits of a ${widget.result}'.toUpperCase(),
                  color: Colors.white,
                ),
                SizedBox(height: Dimensions.height10),
                Container(
                  height: Dimensions.height10 * 40,
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
                              widget.result == 'Relater'
                                  ? RelaterTraits[index]
                                  : widget.result == "Socializer"
                                      ? SocializerTraits[index]
                                      : widget.result == 'Thinker'
                                          ? ThinkerTraits[index]
                                          : DirectorTraits[index],
                              style: TextStyle(
                                  color: AppColors.primaryTextColor,
                                  fontSize: Dimensions.font20),
                            ),
                            Divider(
                              thickness: 1,
                              height: Dimensions.height20,
                            ),
                          ],
                        ),
                      );
                    }),
                    itemCount: widget.result == 'Relater'
                        ? RelaterTraits.length
                        : widget.result == "Socializer"
                            ? SocializerTraits.length
                            : widget.result == 'Thinker'
                                ? ThinkerTraits.length
                                : DirectorTraits.length,
                  ),
                ),
                SizedBox(height: Dimensions.height20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton.icon(
                      icon: const Icon(Icons.refresh_rounded),
                      label: Text(
                        'Re-Try',
                        style: TextStyle(fontSize: Dimensions.font20),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: widget.result == 'Relater'
                              ? const Color(0xff4472C4)
                              : widget.result == "Socializer"
                                  ? const Color(0xffED7D31)
                                  : widget.result == 'Thinker'
                                      ? const Color(0xff00B050)
                                      : const Color(0xffFFC000),
                          padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.width30)),
                      onPressed: () {
                        clearData();
                        Get.offAll(() => const QuizScreen(),
                            transition: Transition.leftToRight);
                      },
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: widget.result == 'Relater'
                                ? const Color(0xff4472C4)
                                : widget.result == "Socializer"
                                    ? const Color(0xffED7D31)
                                    : widget.result == 'Thinker'
                                        ? const Color(0xff00B050)
                                        : const Color(0xffFFC000),
                            padding: EdgeInsets.symmetric(
                                horizontal: Dimensions.width30)),
                        onPressed: () {
                          Get.to(() => const MoreInfoScreen(),
                              transition: Transition.rightToLeft);
                        },
                        child: Text(
                          'More Info',
                          style: TextStyle(fontSize: Dimensions.font20),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget RelaterCard() {
  return Hero(
    tag: 'result',
    child: Container(
      height: Dimensions.height20 * 9,
      width: Dimensions.height20 * 9,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius15 * 2),
          color: const Color(0xff4472C4)),
      child: Center(
        child: BigText(
          text: "Relater",
          color: Colors.white,
          size: Dimensions.font26,
        ),
      ),
    ),
  );
}

Widget SocializerCard() {
  return Container(
    height: Dimensions.height20 * 9,
    width: Dimensions.height20 * 9,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radius15 * 2),
        color: const Color(0xffED7D31)),
    child: Center(
      child: BigText(
        text: "Socializer",
        color: Colors.white,
        size: Dimensions.font26,
      ),
    ),
  );
}

Widget ThinkerCard() {
  return Container(
    height: Dimensions.height20 * 9,
    width: Dimensions.height20 * 9,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radius15 * 2),
        color: const Color(0xff00B050)),
    child: Center(
      child: BigText(
        text: "Thinker",
        color: Colors.white,
        size: Dimensions.font26,
      ),
    ),
  );
}

Widget DirectorCard() {
  return Container(
    height: Dimensions.height20 * 9,
    width: Dimensions.height20 * 9,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radius15 * 2),
        color: const Color(0xffFFC000)),
    child: Center(
      child: BigText(
        text: "Director",
        color: Colors.white,
        size: Dimensions.font26,
      ),
    ),
  );
}
