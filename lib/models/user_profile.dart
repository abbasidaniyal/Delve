  import 'package:flutter/material.dart';

class UserProfile {
  String name;
  String email;
  String gitAccount;
  //String profilePhotoUrl;

  UserProfile(
      {
      @required this.name,
      this.email,
      this.gitAccount});
      //this.profilePhotoUrl});
}
