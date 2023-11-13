import 'package:flutter/material.dart';
import 'package:flutter_modules_app/modules/inicio.dart';
import 'package:flutter_modules_app/modules/register.dart';
import 'package:flutter_modules_app/modules/shop/adapters/screens/shop.dart';
class ShopNavigation extends StatelessWidget {

  const ShopNavigation({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/shop',
      routes: {
        '/shop': (context) => const Shop(),
        '/inicio' : (context) => const Inicio(),
        '/register' :(context) => const Register(),
      },
    );
  }
}