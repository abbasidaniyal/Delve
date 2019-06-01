import 'package:flutter/material.dart';
import '../scoped_models/main_model.dart';
import 'package:scoped_model/scoped_model.dart';

class LoginForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginFormState();
  }
}

class _LoginFormState extends State<LoginForm> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Map<String, String> loginData = {};

  void submitForm() {
    if (_formKey.currentState.validate()) {
      MainModel model = ScopedModel.of(context);

      model.login(loginData);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: "Username"),
                  validator: (username) {
                    if (username.isEmpty) return "Please Enter username";
                  },
                  onSaved: (username) {
                    setState(() {
                      loginData["username"] = username;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Password"),
                  validator: (password) {
                    if (password.isEmpty) return "Please enter password";
                  },
                  onSaved: (password) {
                    setState(() {
                      loginData["password"] = password;
                    });
                  },
                ),
              ],
            )));
  }
}
