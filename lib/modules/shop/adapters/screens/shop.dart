import 'package:flutter/material.dart';
import 'package:flutter_modules_app/kernel/colors/colors_app.dart';
import 'package:flutter_modules_app/kernel/widgets/container_shop.dart';

class Shop extends StatelessWidget {
const Shop({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    final Map <String, dynamic> item = {
      'title': 'Iphone 14',
      'description': 'Nuevo Iphone 14 con 256 GB de almacenamiento',
      'initialRaiting': 3.5,
      'imageUri': 'assets/images/logo-utez.png',
    };
      final Map <String, dynamic> item2 = {
      'title': 'Iphone 14',
      'description': 'Nuevo Iphone 14 con 256 GB de almacenamiento',
      'initialRaiting': 4.5,
      'imageUri': 'assets/images/iphone.jpg',
    };

    final List items = [item, item2];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tienda'),
        backgroundColor: ColorsApp.primaryColor,
        foregroundColor: ColorsApp.whiteColor,
      ),
      body: GridView.count(
  primary: false,
  padding: const EdgeInsets.all(8),
  crossAxisSpacing: 8,
  mainAxisSpacing: 10,
  crossAxisCount: 2,
  children: List.generate(items.length, (index) {
     return ContainerShop(
        title: items[index]['title'],
        description: items[index]['description'],
        initialRaiting: items[index]['initialRaiting'],
        imageUri: items[index]['imageUri'],
      
   );
   
   }
   )

      ),
    );
  }
}