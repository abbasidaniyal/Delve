import 'package:delve/pages/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';
import '../scoped_models/main_model.dart';

class NewPostPage extends StatefulWidget {
  @override
  _NewPostPageState createState() => _NewPostPageState();
}

class _NewPostPageState extends State<NewPostPage> {
  GlobalKey<FormState> postKey = GlobalKey<FormState>();
  Map<String, String> postData = {};
  @override
  Widget build(BuildContext context) {
    MainModel model = ScopedModel.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("New Post"),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Form(
            key: postKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: "Title"),
                  validator: (title) {
                    if (title.isEmpty) return "Please Enter Title";
                  },
                  onSaved: (title) {
                    setState(() {
                      postData["title"] = title;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Body"),
                  validator: (body) {
                    if (body.isEmpty) return "Please enter body";
                  },
                  onSaved: (body) {
                    setState(() {
                      postData["body"] = body;
                    });
                  },
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: RaisedButton(
                    color: Theme.of(context).primaryColor,
                    child: Text("Submit"),
                    onPressed: () {
                      postKey.currentState.save();
                      if (postKey.currentState.validate()) {
                        model
                            .createPost(model.accessToken, postData)
                            .then((onValue) {
                          postKey.currentState.dispose();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return HomePage();
                              },
                            ),
                          );
                        });
                      }
                    },
                  ),
                )
              ],
            )),
      ),
    );
  }
}
