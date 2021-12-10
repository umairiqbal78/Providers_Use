import 'package:flutter/material.dart';

import 'package:practise/usermodel.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

class UserAge extends StatelessWidget {
  const UserAge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<User>(builder: (context, user, child) {
      return Column(
        children: [
          ListTile(
            title: Text(user.age.toString()),
          ),
          UpdateUserAge(),
        ],
      );
    });
    // child: UpdateUserAge());
  }
}

class UpdateUserAge extends StatefulWidget {
  const UpdateUserAge({Key? key}) : super(key: key);

  @override
  State<UpdateUserAge> createState() => _UpdateUserAgeState();
}

class _UpdateUserAgeState extends State<UpdateUserAge> {
  String? age;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10.0,
        ),
        // NumberInputWithIncrementDecrement(
        //   controller: TextEditingController(),
        //   min: 8,
        //   // onIncrement: (newValue) => age = newValue,
        //   // onDecrement: (newValue) => age = newValue,
        //   onChanged: (newValue) => age = newValue,
        // ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: TextFormField(
            decoration: const InputDecoration(labelText: "Enter only Digits"),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ], // Only numbers can be entered
            onChanged: (value) => age = value,
          ),
        ),
        ElevatedButton(
            onPressed: () {
              context.read<User>().updateAge(age);
            },
            child: const Text("Update Age"))
      ],
    );
  }
}
