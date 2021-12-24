import 'package:flutter/material.dart';

class Person extends StatelessWidget {
  const Person({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Profile", textAlign: TextAlign.center,),
        ),
      ),
      body: Center(
        child: Text("Profile", textAlign: TextAlign.center,),
      ),
    );
  }
}
