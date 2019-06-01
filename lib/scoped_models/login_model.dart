import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

mixin LoginModel on Model {
  bool hasLoggedIn = false;

  
  Future<bool> login(loginData) async {
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
        }
      },
    );
    return hasLoggedIn;
  }
}
