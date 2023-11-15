import 'package:flutter/material.dart';
import 'package:flutter_modules_app/kernel/colors/colors_app.dart';
import 'package:flutter_modules_app/kernel/widgets/custom_carrousel.dart';


class News extends StatefulWidget {
  const News({super.key});

  @override
  State<News> createState() => _NewsState();
}





class _NewsState extends State<News> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> itemList = [
     const FirstSection()
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Noticias'),
        backgroundColor: ColorsApp.primaryColor,
      ),
      body: Center(
        child: CustomCarousel(itemList: itemList, carouselHeight: 300),
      ),
    );
  }
}

class FirstSection extends StatelessWidget {
  const FirstSection({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(children: [
        Image.asset('assets/images/logo-utez.png',
            width: width, 
            height: 150,
            fit: BoxFit.fitWidth),
            Container(
              padding: const EdgeInsets.all(16),
              child: const  Align(
                alignment: Alignment.topLeft,
                child: Text('UTEZ - ESCUELA DE CALIDAD',
                style: TextStyle(fontWeight: FontWeight.bold),),
                
                ),
        )
      ]),
    
    );
  }
}
