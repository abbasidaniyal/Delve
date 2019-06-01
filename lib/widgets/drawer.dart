import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
            decoration: BoxDecoration(
              
            ),
            child: InkWell(
              child: Text("Profile"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ProfilePage();
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
