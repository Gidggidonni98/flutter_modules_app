import 'package:flutter/material.dart';
import 'package:flutter_modules_app/kernel/colors/colors_app.dart';

class ShopCard extends StatefulWidget {
  const ShopCard({Key? key}) : super(key: key);

  @override
  State<ShopCard> createState() => _ShopCardState();
}

@override
void initState() async {}

class _ShopCardState extends State<ShopCard> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 32,
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: ListCardShop()),
        ],
      ),
    );
  }
}

class ListCardShop extends StatelessWidget {
  const ListCardShop({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(children: [
          Image.asset(
            'assets/images/iphone.jpg',
            width: 90,
            height: 80,
          ),
          Container(
              margin: const EdgeInsets.only(left: 8),
              child: const Column(
                children: [
                  Text('Iphone 19 pro plus max s'),
                  Text(
                    '\$200000',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: ColorsApp.successColor),
                  ),
                  Text('Descripción de ejemploo'),
                ],
              )),
          ElevatedButton(onPressed: () {}, child: const Text('Eliminar'))
        ]),
      ),
    );
  }
}
