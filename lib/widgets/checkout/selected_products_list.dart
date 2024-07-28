import 'package:flutter/material.dart';
import '../common/global_variables.dart';

class SelectedProductsList extends StatelessWidget {
  final bool showDeleteButton;
  final void Function(BuildContext context, int index)? onTap;

  const SelectedProductsList(
      {super.key, this.showDeleteButton = false, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: carts.length,
      itemBuilder: (context, index) {
        final cartItem = carts[index];
        return Card(
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          elevation: 1.5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(vertical: 06, horizontal: 13),
            leading: Container(
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFF003366).withOpacity(0.1),
                image: DecorationImage(
                  image: AssetImage(
                    cartItem['imageUrl'],
                  ),
                ),
              ),
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
                  padding: EdgeInsets.symmetric(vertical: 3, horizontal: 6),
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
                  padding: EdgeInsets.symmetric(vertical: 3, horizontal: 6),
                  child: Text('\$${cartItem['price']}'),
                ),
              ],
            ),
            trailing: showDeleteButton
                ? IconButton(
              color: Colors.red,
              onPressed: () {
                onTap?.call(context, index);
              },
              icon: Icon(Icons.delete),
            )
                : null,
          ),
        );
      },
    );
  }
}
