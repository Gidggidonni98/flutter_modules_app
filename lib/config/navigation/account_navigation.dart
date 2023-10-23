import 'package:flutter/material.dart';
import 'package:flutter_modules_app/modules/account.dart';
import 'package:flutter_modules_app/modules/inicio.dart';
import 'package:flutter_modules_app/modules/register.dart';
class AccountNavigation extends StatelessWidget {

  const AccountNavigation({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/account',
      routes: {
        '/account': (context) => const Account(),
        '/inicio' : (context) => const Inicio(),
        '/register' :(context) => const Register(),
      },
    );
  }
}