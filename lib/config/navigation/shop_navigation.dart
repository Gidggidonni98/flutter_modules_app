import 'package:flutter/material.dart';
import 'package:flutter_modules_app/modules/shop/adapters/screens/shop.dart';
import 'package:flutter_modules_app/modules/shop/adapters/screens/shop_detail.dart';
class ShopNavigation extends StatelessWidget {

  const ShopNavigation({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/shop',
      routes: {
        '/shop': (context) => const Shop(),
        '/shop/detail-shop': (context) => const ShopDetail(),
      },
    );
  }
}
