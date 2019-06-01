import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_profile.dart';

mixin LoginModel on Model {
  bool hasLoggedIn = false;
  String accessToken;
  UserProfile loggedInUser;

  Future<bool> login(loginData) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    print(json.encode(loginData));
    await http
        .post('http://168.61.208.104/api/auth/login',
            headers: {"Content-Type": "application/json"},
            body: json.encode(loginData))
        .then(
      (http.Response res) {
        print(res.body);
        if (res.statusCode == 200) {
          print(res.body);
          hasLoggedIn = true;
          notifyListeners();
          var body = json.decode(res.body);
          accessToken = body["token"];
          preferences.remove("token");
          preferences.setString("token", accessToken);

          http.get("http://168.61.208.104/api/user/getUser",
              headers: {"token": accessToken}).then((res) {
            if (res.statusCode == 200) {
              print(res.body);
              var temp = json.decode(res.body);
              loggedInUser = UserProfile(
                name: temp["name"],
                email: temp["email"],
              );
              print("LOGGED IN" + loggedInUser.name);
            }
          });
        }
      },
    );
    return hasLoggedIn;
  }

  Future<Null> getProfileData() async {
    await http.get("http://168.61.208.104/api/user/getUser",
        headers: {"token": accessToken}).then((res) {
      if (res.statusCode == 200) {
        print(res.body);
        var temp = json.decode(res.body);
        loggedInUser = UserProfile(
          name: temp["name"],
          email: temp["email"],
        );
        print("LOGGED IN" + loggedInUser.name);
      }
    });
  }

  void logout() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
    accessToken = null;
    notifyListeners();
  }
}
