import 'package:flutter/material.dart';
import 'package:practise/parentWidget.dart';
import 'package:practise/usermodel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
          create: (context) =>
              User("umair", "umairiqbal9889@gmail.com", 21.toString()),
          child: const ParentWidget()),
    );
  }
}
