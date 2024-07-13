import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({
    super.key,
    required this.title,
    required this.imgUrl,
    required this.price,
    required this.sizes,
  });

  final String title;
  final String imgUrl;
  final String price;
  final List<int> sizes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Details',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Color(0xFF003366),
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xFF003366),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w600,
                color: Color(0xFF003366),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Image.asset(imgUrl),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              color: const Color(0xFF003366).withOpacity(0.1),
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(25),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$$price',
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF003366),
                  ),
                ),
                SizedBox(
                  height: 60,
                  child: ListView.builder(
                    itemCount: sizes.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final size = sizes[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Chip(
                          label: Text(
                            size.toString(),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: const Color(0xFF003366).withOpacity(0.8),
                      borderRadius: BorderRadius.circular(40)),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 06,
                      ),
                      Text(
                        'Add To Cart',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
