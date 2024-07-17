import 'package:flutter/material.dart';
import '../global_variables.dart';

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
        title: Text(
          'Cart',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Color(0xFF003366),
          ),
        ),
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xFF003366)),
      ),
      body: RefreshIndicator(
        onRefresh: _refreshCart,
        child: carts.isNotEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: false,
                      itemCount: carts.length,
                      itemBuilder: (context, index) {
                        final cartItem = carts[index];
                        return Card(
                          margin:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            contentPadding: EdgeInsets.all(12),
                            leading: CircleAvatar(
                              radius: 40,
                              backgroundColor:
                                  Color(0xFF003366).withOpacity(0.1),
                              backgroundImage: AssetImage(cartItem['imageUrl']),
                            ),
                            title: Text(
                              cartItem['title'],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF003366),
                              ),
                            ),
                            subtitle: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Color(0xFF003366).withOpacity(0.07),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 3, horizontal: 6),
                                  child: Text('Size: ${cartItem['size']}'),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Color(0xFF003366).withOpacity(0.07),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 3, horizontal: 6),
                                  child: Text('\$${cartItem['price']}'),
                                ),
                              ],
                            ),
                            trailing: IconButton(
                              onPressed: () {
                                _showDeleteDialog(context, index);
                              },
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    elevation: 4,
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
                            onPressed: () {},
                            child: Row(
                              children: [
                                Text(
                                  'Checkout',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                                Icon(
                                  Icons.navigate_next,
                                  color: Colors.white,
                                  size: 27,
                                )
                              ],
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Color(0xFF003366).withOpacity(0.8),
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
