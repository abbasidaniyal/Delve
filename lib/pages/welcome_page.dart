import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../scoped_models/main_model.dart';

import './home_page.dart';
import './landing_page.dart';

class WelcomePage extends StatelessWidget {
  String token;
  WelcomePage({this.token});

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
      builder: (context, child, model) {
        print(token);
        if (token != null) {
          model.accessToken = token;
        }
        print(model.accessToken);
        return SplashScreen(
          seconds: 2,
          image: Image.asset("lib/assets/logo.jpg"),
          photoSize: 200,
          backgroundColor: Theme.of(context).primaryColor,
          navigateAfterSeconds:
              model.accessToken == null ? LoginPage() : HomePage(),
        );
      },
    );
  }
}
