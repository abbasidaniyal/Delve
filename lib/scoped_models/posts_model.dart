import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/post.dart';

mixin PostModel on Model {
  List<Post> postArray = [];
  List<Post> userPostArray = [];
  bool hasPostLoaded = false;

  Future<bool> initPosts(token) async {
    await http.get("http://168.61.208.104/api/posts/getPosts", headers: {
      // "Content-Type": "application/json",
      // "token": token,
    }).then((res) {
      // print(res.body);
      if (res.statusCode == 200) {
        var temp = json.decode(res.body);
        List<dynamic> array = temp["posts"];
        postArray = [];

        for (var x in array) {
          postArray.add(Post(
              title: x["title"],
              body: x["body"],
              writerUsername: x["username"]));
        }
        // print(postArray);
      }
    });
  }

  Future<bool> initUserPosts(token) async {
    await http.get("http://168.61.208.104/api/posts/getPosts", headers: {
      // "Content-Type": "application/json",
      "token": token,
    }).then((res) {
      // print(res.body);
      if (res.statusCode == 200) {
        var temp = json.decode(res.body);
        List<dynamic> array = temp["posts"];
        userPostArray = [];

        for (var x in array) {
          userPostArray.add(Post(
              title: x["title"],
              body: x["body"],
              writerUsername: x["username"]));
        }
        // print(userPostArray);
      }
    });
  }

  Future<bool> createPost(token, postData) async {
    bool postCreated = false;
    // print(json.encode(postData));
    // print(token);
    await http
        .post("http://168.61.208.104/api/posts/new",
            headers: {
              "Content-Type": "application/json",
              "token": token,
            },
            body: json.encode(postData))
        .then((res) {
      // print(res.body);

      if (res.statusCode == 200) {
        postCreated = true;
      }
    });
    return postCreated;
  }
}
