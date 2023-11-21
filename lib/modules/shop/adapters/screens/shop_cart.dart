import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShopCart extends StatelessWidget{
  const ShopCart({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Column(
          children: [
            SizedBox(height: 32),
            Padding(
              padding: EdgeInsets.symmetric(horizontal:8 ),
              child: ListCartShop(),
            ),
          ],
        ),
      );
  }
}

class ListCartShop extends StatefulWidget{
  const ListCartShop({super.key});

  @override
  State<ListCartShop> createState() => _ListCartShopState();
}

class _ListCartShopState extends State<ListCartShop> {
  List<Map<String, dynamic>> items = [];


  void initState(){
    super.initState();
    _loadCartItem();
  }

  Future<void> _loadCartItem() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? itemString = prefs.getString('items');
    if (itemString != null) {
      setState(() {
        items = List<Map<String, dynamic>>.from(json.decode(itemString).map((i) => i as Map<String, dynamic>));
        print(items);
      });
    }
  }

@override
Widget build(BuildContext context) {
  return items.isEmpty ? 
  const Center(child: Text('No hay articulos en el carrito')) :
   SizedBox(
    height: MediaQuery.of(context).size.height - 100,
    child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            child: Column(
              children: [
                Image.asset(items[index]['imageUri'],
                    width: 150, height: 150, fit: BoxFit.fitWidth),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 250,
                        child: Text(
                          items[index]['title'],
                          style: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Spacer(),
                      Column(
                        children: [
                          Text('\$${items[index]['price']}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green)),
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 250,
                        child: Text(
                          items[index]['description'],
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.normal),
                        ),
                      ),
                      const Spacer(),
                      Column(
                        children: [
                          IconButton(
                            onPressed: () async {
                              SharedPreferences prefs = await SharedPreferences.getInstance();
                              List<Map<String, dynamic>> newItems = items;
                              newItems.removeAt(index);
                              prefs.setString('items', json.encode(newItems));
                              setState(() {
                                items = newItems;
                              });
                            },
                            icon: const Icon(Icons.delete, color: Colors.red,),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
  );
  }
}