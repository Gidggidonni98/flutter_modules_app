import 'package:flutter/material.dart';
import 'package:flutter_modules_app/modules/forms/adapters/screens/login.dart';

class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Account')),
      body: const Login(),
    );
  }

}