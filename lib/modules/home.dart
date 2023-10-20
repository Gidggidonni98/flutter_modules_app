import 'package:flutter/material.dart';
import 'package:flutter_modules_app/forms/adapters/screens/first_form.dart';
import 'package:flutter_modules_app/kernel/colors/colors_app.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home'), backgroundColor: ColorsApp.primaryColor,),
      body: const FirstForm(),
    );
  }

}