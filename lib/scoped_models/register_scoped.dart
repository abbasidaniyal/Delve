import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

mixin RegisterModel on Model {
  bool isRegistered = false;

  Future<bool> register(registerData) async {
    await http.post('url', body: json.encode(registerData)).then(
      (http.Response res) {
        if (res.statusCode == 200) {
          print(res.body);
          isRegistered = true;
        }
      },
    );
    return isRegistered;
  }
}
