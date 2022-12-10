import 'package:Comm_type/screens/animation_screen.dart';
import 'package:Comm_type/screens/login_screen.dart';
import 'package:Comm_type/screens/more_info_screen.dart';
import 'package:Comm_type/screens/quiz_screen.dart';
import 'package:Comm_type/screens/result_screen.dart';
import 'package:Comm_type/screens/splash_screen.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String splashScreen = '/splash-screen';
  static const String quizScreen = '/quiz-screen';
  static const String loginScreen = '/login-screen';
  static const String resultScreen = '/result-screen';
  static const String animationScreen = '/animation-screen';
  static const String moreInfoScreen = '/moreinfo-screen';

  static get result => null;

  static String getSplashScreen() => splashScreen;
  static String getQuizScreen() => quizScreen;
  static String getResultScreen() => resultScreen;
  static String getAnimationScreen() => animationScreen;
  static String getLoginScreen() => loginScreen;
  static String getmoreInfoScreen() => moreInfoScreen;

  static List<GetPage> routes = [
    GetPage(
        name: splashScreen,
        page: () => SplashScreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: quizScreen,
        page: () => const QuizScreen(),
        transition: Transition.fadeIn),
    // GetPage(
    //   name: loginScreen,
    //   page: () => const LoginScreen(),
    // ),
    GetPage(name: resultScreen, page: () => ResultScreen(result: result)),
    GetPage(
        name: animationScreen, page: () => AnimationScreen(userType: result)),
    GetPage(name: loginScreen, page: () => LoginScreen()),
    GetPage(
        name: moreInfoScreen,
        page: () => MoreInfoScreen(),
        transition: Transition.leftToRight),
    // GetPage(name: loginScreen, page: loginScreen()),
  ];
}
