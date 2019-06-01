import 'package:delve/scoped_models/main_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:scoped_model/scoped_model.dart';

import '../pages/landing_page.dart';
import '../pages/profile_page.dart';

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
            decoration: BoxDecoration(),
            child: InkWell(
              child: Text(
                "Profile",
                textScaleFactor: 1.3,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ScopedModelDescendant<MainModel>(
                        builder: (context, child, model) {
                          return ProfilePage(model.loggedInUser);
                        },
                      );
                    },
                  ),
                );
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(),
            child: InkWell(
              child: Text(
                "Logout",
                textScaleFactor: 1.3,
              ),
              onTap: () {
                MainModel model = ScopedModel.of(context);
                model.logout();
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
        ],
      ),
    );
  }
}
