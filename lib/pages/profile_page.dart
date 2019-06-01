import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../scoped_models/main_model.dart';

import '../models/user_profile.dart';
import '../models/post.dart';
import './post_page.dart';
//import 'package:intl/intl.dart';

class ProfilePage extends StatefulWidget {
  final UserProfile user;

  ProfilePage(this.user);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<Post> array = [];

  @override
  Widget build(BuildContext context) {
    double nameSize = MediaQuery.of(context).size.width * 0.1;
    double headingSize = MediaQuery.of(context).size.width * 0.04;
    double contentSize = MediaQuery.of(context).size.width * 0.04;
    MainModel model = ScopedModel.of(context);

    model.initUserPosts(model.accessToken).then((onValue) {
      setState(() {
        array = [];
        array = model.userPostArray;
      });
    });

    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
            "User Profile",
            textScaleFactor: 1,
            style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
            textAlign: TextAlign.left,
          ),
        ),
        body: Column(
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
                      image: AssetImage("lib/assets/profileBackground.jpg"),
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
                        SizedBox(
                          height: 30.0,
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.50,
                              top: 35.0),
                          child: Text(
                            widget.user.name,
                            textScaleFactor: 1,
                            maxLines: 1,
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
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
                          ],
                        ),
                        Container(
                          // width: MediaQuery.of(context).size.width * 0.2,
                          margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.50,
                              top: 5.0),
                          child: SingleChildScrollView(
                            child: Text(
                              widget.user.email,
                              textScaleFactor: 1,
                              maxLines: 1,
                              style: TextStyle(
                                  color: Colors.white, fontSize: contentSize),
                            ),
                          ),
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
                        image: AssetImage("lib/assets/profilePicture.jpg"),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                
                scrollDirection: Axis.vertical,
                itemCount: array.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return PostPage(array[index]);
                      }));
                    },
                    child: Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 40.0, vertical: 20.0),
                        // height: MediaQuery.of(context).size.height * 0.8,
                        child: Card(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 25.0, vertical: 10.0),
                          elevation: 20.0,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                          ),
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            child: Stack(
                              children: <Widget>[
                                Image.asset(
                                  "lib/assets/postBackground.png",
                                  fit: BoxFit.fitWidth,
                                  height: 300,
                                ),
                                Container(
                                  padding: EdgeInsets.all(15.0),
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        array[index].title,
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 200),
                                      Container(
                                        child: Text(
                                          array[index].body,
                                          maxLines: 2,
                                          textAlign: TextAlign.left,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        )),
                  );
                },
              ),
            )
          ],
        ));
  }
}
