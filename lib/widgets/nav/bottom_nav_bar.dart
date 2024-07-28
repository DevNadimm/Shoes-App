import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:shop_app/screens/product_list_screen.dart';
import '../../screens/cart_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  List<Widget> screens = [ProductListScreen(), CartScreen()];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          SalomonBottomBarItem(
            icon: Icon(Icons.home_rounded),
            title: Text("Home"),
            selectedColor: Color(0xFF003366).withOpacity(0.8),
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.shopping_cart_rounded),
            title: Text("Cart"),
            selectedColor: Color(0xFF003366).withOpacity(0.8),
          ),
        ],
      ),
    );
  }
}
