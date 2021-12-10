// import 'package:email_validator/email_validator.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:practise/usermodel.dart';
import 'package:provider/provider.dart';
import 'dart:core';

class UserEmail extends StatelessWidget {
  const UserEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return Column(
      children: [
        ListTile(
          title: Text(user.email.toString()),
        ),
        const UpdateUserEmail(),
      ],
    );
  }
}

class UpdateUserEmail extends StatefulWidget {
  const UpdateUserEmail({Key? key}) : super(key: key);

  @override
  State<UpdateUserEmail> createState() => _UpdateUserEmailState();
}

class _UpdateUserEmailState extends State<UpdateUserEmail> {
  String? email;
  final _emailcontroller = TextEditingController();
  bool isvalid = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 10.0,
          ),
          Form(
            // autovalidateMode: AutovalidateMode.onUserInteraction,
            child: TextFormField(
                controller: _emailcontroller,
                decoration: const InputDecoration(
                  labelText: "Email",
                )),
          ),
          ElevatedButton(
              onPressed: () {
                isvalid = EmailValidator.validate(_emailcontroller.text);
                if (isvalid) {
                  context.read<User>().updateEmail(_emailcontroller.text);
                } else {
                  Fluttertoast.showToast(
                      msg: "Please Enter a valid Email",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
                }
              },
              child: const Text("Update Email"))
        ],
      ),
    );
  }
}
