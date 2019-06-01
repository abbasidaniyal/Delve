import 'package:delve/models/post.dart';
import 'package:delve/scoped_models/main_model.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../scoped_models/main_model.dart';
import '../widgets/drawer.dart';
import './new_post_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isPostLoaded = false;
  List<Post> array = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    MainModel model = ScopedModel.of(context);
    model.initPosts(model.accessToken).then((onValue) {
      setState(() {
        array = model.postArray;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      drawer: Drawer(),
      body: Container(
        child: ListView.builder(
          itemCount: array.length,
          itemBuilder: (context, index) {
            return Card(
              child: Column(
                children: <Widget>[
                  Container(
                    child: Text(array[index].title),
                  ),
                  Container(
                    child: Text(array[index].body),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
