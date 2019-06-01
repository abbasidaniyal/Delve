import 'package:delve/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../pages/login_page.dart';
import '../pages/register_page.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          AppBar(
            automaticallyImplyLeading: false,
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              
            ),
            child: InkWell(
              child: Text("Home"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return HomePage();
                    },
                  ),
                );
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            child: InkWell(
              child: Text("Login"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginPage();
                    },
                  ),
                );
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            child: InkWell(
              child: Text("Register"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return RegisterPage();
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
