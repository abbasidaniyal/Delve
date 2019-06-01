import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import './home_page.dart';
import './register_page.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 2,
      image: Image.asset("lib/assets/logo.jpg"),
      photoSize: 200,
      backgroundColor: Theme.of(context).primaryColor,
      navigateAfterSeconds: HomePage(),
    );
  }
}
