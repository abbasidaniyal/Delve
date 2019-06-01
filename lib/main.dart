import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import './pages/welcome_page.dart';
import './scoped_models/main_model.dart';

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
            // primaryColor: Colors
            ),
        home: WelcomePage(),
      ),
    );
  }
}
