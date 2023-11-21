import 'package:flutter/material.dart';
import 'package:flutter_modules_app/kernel/colors/colors_app.dart';

class AccessShopCart extends StatelessWidget {
  const AccessShopCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, '/shop/shop-cart');
      },
      child: Container(
        width: 25,
        height: 25,
        margin: const EdgeInsets.all(16),
        decoration: const BoxDecoration(color: Colors.transparent, shape: BoxShape.circle),
        child: const Icon(Icons.shopping_cart, color: ColorsApp.whiteColor, size: 30,)
      )
    );
  }
}