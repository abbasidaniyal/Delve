import 'package:flutter/material.dart';
import '../scoped_models/main_model.dart';
import 'package:scoped_model/scoped_model.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Map<String, String> loginData = {};


  void submitForm() {
    _formKey.currentState.save();
    if (_formKey.currentState.validate()) {
      MainModel model = ScopedModel.of(context);

      model.login(loginData).then((status){
        if(status){
          
        } else {
      
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Form(
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
                Container(
                  margin: EdgeInsets.all(20),
                  child: RaisedButton(
                    color: Theme.of(context).primaryColor,
                    child: Text("Submit"),
                    onPressed: submitForm,
                  ),
                )
              ],
            )),
      ),
    );
  }
}
