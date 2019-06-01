import 'package:delve/models/post.dart';
import 'package:delve/scoped_models/main_model.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../scoped_models/main_model.dart';
import '../widgets/drawer.dart';
import './new_post_page.dart';
import './post_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isPostLoaded = false;
  List<Post> array = [];

  @override
  void initState() {
    super.initState();
    MainModel model = ScopedModel.of(context);
    model.initPosts(model.accessToken).then((onValue) {
      setState(() {
        array = [];
        array = model.postArray;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text("Delve"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return NewPostPage();
              }));
            },
          )
        ],
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: array.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return PostPage(array[index]);
              }));
            },
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                // height: MediaQuery.of(context).size.height * 0.8,
                child: Card(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 25.0, vertical: 10.0),
                  elevation: 20.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
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
                                    fontSize: 24, fontWeight: FontWeight.bold),
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
    );
  }
}
