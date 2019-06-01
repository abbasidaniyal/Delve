import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

mixin RegisterModel on Model {
  bool isRegistered = false;

  Future<bool> register(registerData) async {
    print(json.encode(registerData));
    await http
        .post('http://168.61.208.104/api/auth/register',
        headers: {
          "Content-Type": "application/json"
        },
            body: json.encode(registerData))
        .then(
      (http.Response res) {
        print(res.body);
        if (res.statusCode == 200) {
          print(res.body);
          isRegistered = true;
          notifyListeners();
        }
      },
    );
    return isRegistered;
  }
}
