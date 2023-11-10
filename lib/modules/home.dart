import 'package:flutter/material.dart';
import 'package:flutter_modules_app/kernel/widgets/custom_list_user.dart';
// import 'package:flutter_modules_app/modules/forms/adapters/screens/first_form.dart';
import 'package:flutter_modules_app/kernel/colors/colors_app.dart';

class Home extends StatelessWidget {
  

  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
 
   final Map item = {
    'name': 'Kemish Jimenez Pascual',
    'lastName': 'Mendoza'
  };  
   
   final Map item2 = {
    'name': 'Mahonri Jimenez Pascual',
    'lastName': 'Mendoza'
  }; 
  final List items = [item, item2];
    return Scaffold(
      appBar: AppBar(title: const Text('Home'), backgroundColor: ColorsApp.primaryColor,),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(itemCount: items.length, itemBuilder:  (context, index){
          return CustomListUser(item: items[index]);
        }),
      ),
    );
  }

}