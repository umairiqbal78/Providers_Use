import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practise/age.dart';
import 'package:practise/usermodel.dart';
import 'package:provider/provider.dart';

class UserName extends StatelessWidget {
  const UserName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return Column(
      children: [
        ListTile(
          title: Text(user.username.toString()),
        ),
        const UpdateUserName(),
      ],
    );
  }
}

class UpdateUserName extends StatefulWidget {
  const UpdateUserName({Key? key}) : super(key: key);

  @override
  State<UpdateUserName> createState() => _UpdateUserNameState();
}

class _UpdateUserNameState extends State<UpdateUserName> {
  String? name;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(height: 10.0),
      Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: TextFormField(
            keyboardType: TextInputType.name,
            onChanged: (value) => name = value),
      ),
      ElevatedButton(
          onPressed: () {
            context.read<User>().updateName(name);
          },
          child: const Text("Change Name"))
    ]);
  }
}
