import 'package:flutter/material.dart';
import 'package:practise/age.dart';
import 'package:practise/email.dart';
import 'package:practise/username.dart';

class ParentWidget extends StatelessWidget {
  const ParentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          children: const [
            UserName(),
            UserEmail(),
            UserAge(),
          ],
        )),
      ),
    );
  }
}
