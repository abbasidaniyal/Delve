import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

mixin LoginModel on Model {
  bool hasLoggedIn = false;
  String accessToken;
  
  Future<bool> login(loginData) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    print(json.encode(loginData));
    await http
        .post('http://168.61.208.104/api/auth/login',
        headers: {
          "Content-Type": "application/json"
        },
            body: json.encode(loginData))
        .then(
      (http.Response res) {
        print(res.body);
        if (res.statusCode == 200) {
          print(res.body);
          hasLoggedIn = true;
          notifyListeners();
          var body = json.decode(res.body);
          accessToken= body["token"];
          preferences.setString("token", accessToken);

        }
      },
    );
    return hasLoggedIn;
  }
}
