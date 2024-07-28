import 'package:flutter/material.dart';
import 'package:shop_app/widgets/common/global_variables.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({
    Key? key,
    required this.title,
    required this.imgUrl,
    required this.price,
    required this.sizes,
  }) : super(key: key);

  final String title;
  final String imgUrl;
  final String price;
  final List<int> sizes;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  late int isSelected;

  @override
  void initState() {
    super.initState();
    isSelected = widget.sizes[0];
  }

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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF003366),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Image.asset(widget.imgUrl),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            height: 230,
            decoration: BoxDecoration(
              color: const Color(0xFF003366).withOpacity(0.1),
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(25),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '\$${widget.price}',
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF003366),
                  ),
                ),
                SizedBox(
                  height: 60,
                  child: ListView.builder(
                    itemCount: widget.sizes.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final size = widget.sizes[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isSelected = size;
                            });
                          },
                          child: Chip(
                            padding: const EdgeInsets.all(10),
                            label: Text(
                              size.toString(),
                              style: TextStyle(
                                color: isSelected == size
                                    ? const Color(0XFFFFFFFF)
                                    : const Color(0xFF003366),
                              ),
                            ),
                            side: BorderSide.none,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                            backgroundColor: isSelected == size
                                ? const Color(0xFF003366).withOpacity(0.8)
                                : const Color(0xFF003366).withOpacity(0.02),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Material(
                  clipBehavior: Clip.antiAlias,
                  color: const Color(0xFF003366).withOpacity(0.8),
                  borderRadius: BorderRadius.circular(40),
                  child: InkWell(
                    onTap: addToCart, // Call addToCart function here
                    child: Container(
                      height: 50,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.shopping_cart,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 6,
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
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void addToCart() {
    final product = {
      'title': widget.title,
      'price': double.parse(widget.price),
      'imageUrl': widget.imgUrl,
      'size': isSelected,
    };

    setState(() {
      carts.add(product);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Product added successfully!'),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Undo',
          textColor: Colors.white,
          onPressed: () {
            setState(() {
              carts.remove(product);
            });
          },
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        elevation: 6.0,
      ),
    );
  }
}
