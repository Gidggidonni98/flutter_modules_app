import 'package:flutter/material.dart';
import 'package:flutter_modules_app/kernel/colors/colors_app.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class ContainerShop extends StatelessWidget {
  final String title;
  final String description;
  final double initialRaiting;
  final String imageUri;
  final double price;
  
  const ContainerShop({super.key, required this.title, required this.description, required this.initialRaiting, required this.imageUri, required this.price, });

  @override
  Widget build(BuildContext context) {
    double widthImage = MediaQuery.of(context).size.width;
    return Card(
      elevation: 5,
      child: Column(
        children: [
          Image.asset(imageUri,
              width: widthImage, height: 60, fit: BoxFit.contain),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                 SizedBox(
                  width: 64,
                  child: Text(
                    title,
                    style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                ),
                const Spacer(),
                Column(
                  children: [
                    Text('\$$price', style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),),
                    RatingBar.builder(
                      initialRating: initialRaiting,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 8,
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
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                description,
                style: const TextStyle(color: Colors.black54, fontSize: 8),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/shop/detail-shop', arguments: {
                'title': title,
                'description': description,
                'initialRaiting': initialRaiting,
                'imageUri': imageUri,
                'price': price,
              });
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: ColorsApp.successColor,
              backgroundColor: Colors.white,
              side: const BorderSide(color: ColorsApp.successColor),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: const Text('Ver más'),
          )
        ],
      ),
    );
  }
}
