import 'package:flutter/material.dart';
import 'package:flutter_modules_app/kernel/colors/colors_app.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ShopDetail  extends StatelessWidget{
  const ShopDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final dynamic rawArguments = ModalRoute.of(context)!.settings.arguments;
    final Map<String, dynamic> arguments = (rawArguments as Map<String, dynamic>?) ?? {};
    final title = arguments['title'] ?? '';
    final description = arguments['description'] ?? '';
    final initialRaiting = arguments['initialRaiting'] ?? 0.0;
    final imageUri = arguments['imageUri'] ?? 'assets/images/logo-utez.png';
    final price = arguments['price'] ?? 'Error al leer el precio';
    double widthImage = MediaQuery.of(context).size.width;
    return  Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: ColorsApp.primaryColor,
        foregroundColor: ColorsApp.whiteColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(imageUri,
             width: widthImage, height: 250, fit: BoxFit.fitWidth),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  SizedBox(
                    width: 250,
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold
                      ),  
                    ),
                  ),
                  const Spacer(),
                  Column(
                    children: [
                    Text('\$$price', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: ColorsApp.successColor),),
                      RatingBar.builder(
                        initialRating: initialRaiting,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 16,
                        ignoreGestures: true,
                        itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {},
                      ),
                    ],
                  )
                ],
              )
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                description,
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 14
                ),
              )
            )
          ],
        ),
      ),  
      floatingActionButton: ElevatedButton(
        onPressed: () {
        },
        style: OutlinedButton.styleFrom(
          foregroundColor: ColorsApp.successColor,
          backgroundColor: Colors.white,
          side: const BorderSide(color: ColorsApp.successColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        
        child: const Text('Agregar al carrito'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
 
}
