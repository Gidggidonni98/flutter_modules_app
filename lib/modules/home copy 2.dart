import 'package:flutter/material.dart';
import 'package:flutter_modules_app/kernel/colors/colors_app.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home'), backgroundColor: ColorsApp.primaryColor,),
      body: Column(
        children: <Widget>[
          Container(
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.all(16),
          color: ColorsApp.dangerColor,
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Kemish'),
              Text('Jimenez'),
              Text('Pasxual'),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.all(16),
          color: ColorsApp.dangerColor,
          child: const Row(
            children: [
              Text('Kemish'),
              Text('Jimenez'),
              Text('Pasxual'),
            ],
          ),
        ),
  
        ]
      ),
    );
  }

}