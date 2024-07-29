import 'package:flutter/material.dart';
import 'package:shop_app/screens/checkout_screen.dart';
import '../widgets/common/global_variables.dart';
import '../widgets/checkout/selected_products_list.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double _totalPrice = 0.0;

  Future<void> _refreshCart() async {
    setState(() {
      _calculateTotalPrice();
    });
  }

  void _calculateTotalPrice() {
    double totalPrice = 0.0;
    for (Map<String, dynamic> cart in carts) {
      if (cart.containsKey('price')) {
        totalPrice += cart['price'];
      }
    }
    setState(() {
      _totalPrice = totalPrice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cart',
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
      body: RefreshIndicator(
        onRefresh: _refreshCart,
        color: Color(0xFF003366),
        backgroundColor: Colors.grey.shade100,
        strokeWidth: 3,
        child: carts.isNotEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: SelectedProductsList(
                    onTap: _showDeleteDialog,
                    showDeleteButton: true,
                  )),
                  Card(
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    elevation: 1.5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(16),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Total',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xFF003366),
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                '\$${_totalPrice.toStringAsFixed(2)}',
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Color(0xFF003366),
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => CheckoutScreen(
                                    subTotal: _totalPrice,
                                  ),
                                ),
                              );
                            },
                            child: Text(
                              'Checkout',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Color(0xFF003366).withOpacity(0.8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )
            : Flexible(
                child: Center(
                  child: ListView(
                    padding: EdgeInsets.symmetric(vertical: 160),
                    shrinkWrap: true,
                    children: [
                      Image.asset(
                        'assets/images/empty_cart.png',
                        height: 200,
                      ),
                      Center(
                        child: Text(
                          'Your cart is empty!',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF003366),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  void _showDeleteDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Delete Item',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF003366),
            ),
          ),
          content: Text(
            'Are you sure you want to delete this item from your cart?',
            style: TextStyle(
              color: Color(0xFF003366),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Cancel',
                style: TextStyle(color: Color(0xFF003366)),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  carts.removeAt(index);
                  _calculateTotalPrice();
                  Navigator.of(context).pop();
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}
