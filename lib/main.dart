import 'package:Comm_type/firebase_options.dart';
import 'package:Comm_type/models/result_sheets.dart';
import 'package:Comm_type/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ResultSheetsApi.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();
final messengerKey = GlobalKey<ScaffoldMessengerState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        scaffoldMessengerKey: messengerKey,
        title: 'Type Of Communication',
        defaultTransition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 500),
        theme: ThemeData(
          fontFamily: 'SourceSansPro',
        ),
        home: SplashScreen());
  }
}
