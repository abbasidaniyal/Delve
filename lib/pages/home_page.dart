import 'package:flutter/material.dart';
import '../widgets/drawer.dart';
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(),
      drawer: MyDrawer(),
      body: Container(),
    );
  }
}
