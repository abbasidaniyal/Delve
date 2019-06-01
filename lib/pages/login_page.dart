import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginFormState();
  }
}

class _LoginFormState extends State<LoginForm> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
              validator: (username) {},
            ),
            TextFormField(
              decoration: InputDecoration(labelText: "Password"),
            ),
          ],
        )));
  }
}
