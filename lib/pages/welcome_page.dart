import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import './home_page.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      image: Image.asset("lib/assets/logo.jpg"),
      photoSize: 100,
      navigateAfterSeconds: HomePage(),
    );
  }
}
