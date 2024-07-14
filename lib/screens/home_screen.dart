import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:shop_app/screens/product_list_screen.dart';
import 'cart_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            icon: Icon(Icons.home_filled),
            title: Text("Home"),
            selectedColor: Color(0xFF003366).withOpacity(0.8),
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.shopping_bag_rounded),
            title: Text("Cart"),
            selectedColor: Color(0xFF003366).withOpacity(0.8),
          ),
        ],
      ),
    );
  }
}
