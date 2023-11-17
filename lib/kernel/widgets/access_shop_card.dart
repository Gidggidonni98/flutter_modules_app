import 'package:flutter/material.dart';

class AccessShopCard extends StatelessWidget {
  const AccessShopCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, '/shop/shop-card');
      },
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Icon(Icons.shopping_cart),
      ),
    );
  }
}