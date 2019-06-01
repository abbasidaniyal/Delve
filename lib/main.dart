import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './pages/welcome_page.dart';
import './scoped_models/main_model.dart';
import './pages/landing_page.dart';

void main() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  // SharedPreferences.setMockInitialValues({});
  var token = preferences.get("token");

  // print("Token " + token);

  runApp(Delve(token));
}

class Delve extends StatelessWidget {
  String token;

  Delve(this.token);

  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: MainModel(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: Color.fromRGBO(28, 91, 153, 1),
            accentColor: Color.fromRGBO(255, 250, 245, 1),
          ),
          home: ScopedModelDescendant<MainModel>(
            builder: (context, child, model) {
              model.accessToken = token;  ///////////// CHECK IF TOKEN IS NULL OR NOT
              return WelcomePage();
            },
          )),
    );
  }
}
