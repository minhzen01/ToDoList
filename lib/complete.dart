import 'package:flutter/material.dart';

class Complete extends StatelessWidget {
  const Complete({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Complete", textAlign: TextAlign.center)),
      ),
      body: const Center(
        child: Text("Complete", textAlign: TextAlign.center,),
      ),
    );
  }
}
