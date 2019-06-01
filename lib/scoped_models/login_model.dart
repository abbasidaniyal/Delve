import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

mixin SendCIENMail on Model {
  Future<bool> login(data) async {
    bool response;
    await http
        .post(
      "http://api.fansportsclub.com/form/",
      headers: {
        'Authorization': 'Token $token',
        "Content-Type": "application/json"
      },
      body: json.encode(data),
    )
        .then((res) {
      print(json.encode(data));
      print(res.statusCode);
      print(res.body);
      if (res.statusCode != 200) {
        response = false;
      } else {
        response = true;
      }
      notifyListeners();
    });
    return response;
  }
}