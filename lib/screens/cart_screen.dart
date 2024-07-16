import 'package:flutter/material.dart';
import '../global_variables.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
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
      body: carts.isNotEmpty
          ? ListView.builder(
        itemCount: carts.length,
        itemBuilder: (context, index) {
          final cartItem = carts[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.all(12),
              leading: CircleAvatar(
                radius: 40,
                backgroundColor: Color(0xFF003366).withOpacity(0.1),
                backgroundImage: AssetImage(cartItem['imageUrl']),
              ),
              title: Text(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                cartItem['title'],
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
                    padding:
                    EdgeInsets.symmetric(vertical: 3, horizontal: 6),
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
                    padding:
                    EdgeInsets.symmetric(vertical: 3, horizontal: 6),
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
      )
          : Center(
        child: Text(
          'Your cart is empty',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xFF003366),
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
            style: TextStyle(color: Color(0xFF003366)),
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
                  Navigator.of(context).pop();
                });
              },
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.red
              ),
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}