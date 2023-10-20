import 'package:flutter/material.dart';
import 'package:flutter_modules_app/kernel/colors/colors_app.dart';

class CustomButtonNavigationTab extends StatelessWidget {

  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomButtonNavigationTab({Key? key, required this.selectedIndex, required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: const <BottomNavigationBarItem> [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Inicio'),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Cuenta')
    ],
    currentIndex: selectedIndex,
    selectedItemColor: ColorsApp.successColor,
    onTap: onItemTapped,
    );
  }

}