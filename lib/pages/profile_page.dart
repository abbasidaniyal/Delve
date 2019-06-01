import 'package:flutter/material.dart';

import '../models/user_profile.dart';

//import 'package:intl/intl.dart';

class PlayerProfilePage extends StatelessWidget {
  UserProfile user;

  PlayerProfilePage(this.user);
  @override
  Widget build(BuildContext context) {
    double nameSize = MediaQuery.of(context).size.width * 0.05;
    double headingSize = MediaQuery.of(context).size.width * 0.04;
    double contentSize = MediaQuery.of(context).size.width * 0.04;

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
            "User Profile",
            textScaleFactor: 1,
            style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
            textAlign: TextAlign.left,
          ),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(0),
                    // color: Theme.of(context).primaryColor,
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.topCenter,
                    // height: MediaQuery.of(context).size.height * 0.40,
                    child: Image(
                      image: AssetImage("assets/profileBackground.jpg"),
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.40,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.50,
                              top: 35.0),
                          child: Text(
                            user.name,
                            textScaleFactor: 1,
                            maxLines: 1,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: nameSize),
                          ),
                        ),
                        
                        Row(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width * 0.2,
                              margin: EdgeInsets.only(
                                  left:
                                      MediaQuery.of(context).size.width * 0.50,
                                  top: 20.0),
                              child: Text(
                                "Email",
                                textScaleFactor: 1,
                                maxLines: 1,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: headingSize),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.2,
                              margin: EdgeInsets.only(left: 30.0, top: 20.0),
                              child: Text(
                                "Github:",
                                textScaleFactor: 1,
                                maxLines: 1,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: headingSize),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width * 0.2,
                              margin: EdgeInsets.only(
                                  left:
                                      MediaQuery.of(context).size.width * 0.50,
                                  top: 5.0),
                              child: Text(
                                user.email,
                                textScaleFactor: 1,
                                maxLines: 1,
                                style: TextStyle(
                                    color: Colors.white, fontSize: contentSize),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 30.0, top: 5.0),
                              width: MediaQuery.of(context).size.width * 0.2,
                              child: Text(
                                user.gitAccount,
                                style: TextStyle(
                                    color: Colors.white, fontSize: contentSize),
                              ),
                            )
                          ],
                        ),
                                               
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.35,
                    height: MediaQuery.of(context).size.width * 0.35,
                    margin: EdgeInsets.only(top: 25, left: 20.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.0),
                        color: Theme.of(context).primaryColor),
                    foregroundDecoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 3.0),
                      borderRadius: BorderRadius.circular(100.0),
                      image: DecorationImage(
                        image: user.profilePhotoUrl != null
                            ? NetworkImage(user.profilePhotoUrl)
                            : AssetImage("assets/profilePicture.jpeg"),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}