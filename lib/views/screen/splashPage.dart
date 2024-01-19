import 'dart:async';

import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:media_player/views/screen/songPage.dart';

import '../../utils/routeUtils.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  FlutterLogoStyle myStyle = FlutterLogoStyle.markOnly;

  void changeScreen() {
    Timer.periodic(const Duration(seconds: 5), (timer) {
      setState(() {
        myStyle = FlutterLogoStyle.horizontal;
      });
    });

    Timer.periodic(
      const Duration(seconds: 3),
      (tick) {
        Navigator.of(context).pushReplacementNamed(MyRoutes.loginPage);
        tick.cancel();
      },
    );
  }

  @override
  void initState() {
    super.initState();
    changeScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Spacer(
              flex: 3,
            ),
            Image.asset(
              "assets/audio/svtppm.png",
              scale: 3,
            ),
            const Spacer(
              flex: 1,
            ),
            const Spacer(),
            const Spacer(),
            const LoadingIndicator(
              indicatorType: Indicator.orbit,
              colors: [Colors.indigo],
              strokeWidth: 0.5,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
