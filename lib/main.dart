import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import './pages/welcome_page.dart';
import './scoped_models/main_model.dart';
import './pages/landing_page.dart';

void main() {
  runApp(Delve());
}

class Delve extends StatelessWidget {
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
        home: LoginPage(),
      ),
    );
  }
}
