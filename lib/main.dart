import 'package:flutter/material.dart';
import 'package:media_player/controller/audioController.dart';
import 'package:media_player/helper/apiHelper.dart';
import 'package:media_player/utils/routeUtils.dart';
import 'package:media_player/views/screen/formPage.dart';
import 'package:media_player/views/screen/loginPage.dart';
import 'package:media_player/views/screen/medicalPage.dart';
import 'package:media_player/views/screen/navaShabhyaPage.dart';
import 'package:media_player/views/screen/sikshanPage.dart';
import 'package:media_player/views/screen/songPage.dart';
import 'package:media_player/views/screen/splashPage.dart';
import 'package:media_player/views/screen/vibhvaPage.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
      MultiProvider(
           providers: [
      ChangeNotifierProvider(
        create: (context) => AudioController(),
      ),
      ChangeNotifierProvider(
        create: (context) => videoController(),
      ),
      // ChangeNotifierProvider(
      //   create: (context) => userController(),
      // ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.grey),
      initialRoute: MyRoutes.splashPage,
      routes: {
        MyRoutes.splashPage: (context) => const SplashScreenPage(),
        MyRoutes.songPage: (context) =>  SongPage(),
        MyRoutes.loginPage: (context) =>  LoginPage(controller: PageController()),
        MyRoutes.formPage: (context) =>  FormPage(),
        MyRoutes.sikshaPage: (context) =>  SikshanPage(),
        MyRoutes.navaShabhyaPage: (context) =>  NavaSabhyaPage(),
        MyRoutes.vibhvaPage: (context) =>  VidhvaPage(),
        MyRoutes.medicalpage: (context) =>  MedicalPage(),
      },
    );
  }
}
