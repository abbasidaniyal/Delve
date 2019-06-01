import 'package:flutter/material.dart';

import '../scoped_models/main_model.dart';
import 'package:scoped_model/scoped_model.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Map<String, String> registerData = {};

  void submitForm() {
    _formKey.currentState.save();
    if (_formKey.currentState.validate()) {
      MainModel model = ScopedModel.of(context);

      model.register(registerData).then((status){
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
        title: Text("Register"),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Name",
                ),
                validator: (name) {
                  if (name.isEmpty) return "Please Enter Your Name";
                },
                onSaved: (name) {
                  setState(() {
                    registerData["name"] = name;
                  });
                },
                keyboardType: TextInputType.text,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Email Address",
                ),
                validator: (email) {
                  if (email.isEmpty) return "Please enter your email address";

                  if (!RegExp(r"^[a-zA-Z0-9._+-]+@[a-zA-Z0-9-]+\.[a-zA-Z]+")
                      .hasMatch(email)) {
                    return "Enter a Valid Email Address";
                  }
                },
                onSaved: (email) {
                  setState(() {
                    registerData["email"] = email;
                  });
                },
                keyboardType: TextInputType.emailAddress,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Username",
                ),
                validator: (username) {
                  if (username.isEmpty) return "Please Enter Your UserName";
                },
                onSaved: (username) {
                  setState(() {
                    registerData["username"] = username;
                  });
                },
                keyboardType: TextInputType.text,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Password",
                ),
                validator: (pass) {
                  if (pass.isEmpty) return "Please Enter Your Password";
                },
                onSaved: (pass) {
                  setState(() {
                    registerData["password"] = pass;
                  });
                },
                obscureText: true,
                keyboardType: TextInputType.text,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Re Enter Password",
                ),
                validator: (pass) {
                  if (pass.isEmpty) return "Please Enter Your Password";

                  if (pass != registerData["password"]) {
                    return "Passwords do not match";
                  }
                  
                },
                onSaved: (pass) {
                  setState(() {
                    // registerData["RePassword"] = pass;
                  });
                },
                obscureText: true,
                keyboardType: TextInputType.text,
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
          ),
        ),
      ),
    );
  }
}
