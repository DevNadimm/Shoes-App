import 'package:flutter/material.dart';

class PaymentMethodBottomSheet extends StatelessWidget {
  final Function(Map<String, String>) onSelectMethod;

  PaymentMethodBottomSheet({required this.onSelectMethod});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Image.asset(
                'assets/images/gPay.png',
                scale: 20,
              ),
              title: Text(
                'Google Pay',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                  color: Color(0xFF003366),
                ),
              ),
              onTap: () {
                onSelectMethod({
                  'method': 'Google Pay',
                  'image': 'assets/images/gPay.png'
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Image.asset(
                'assets/images/credit_card.png',
                scale: 20,
              ),
              title: Text(
                'Credit Card',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                  color: Color(0xFF003366),
                ),
              ),
              onTap: () {
                onSelectMethod({
                  'method': 'Credit Card',
                  'image': 'assets/images/credit_card.png'
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Image.asset(
                'assets/images/BKash.png',
                scale: 20,
              ),
              title: Text(
                'BKash',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                  color: Color(0xFF003366),
                ),
              ),
              onTap: () {
                onSelectMethod(
                    {'method': 'BKash', 'image': 'assets/images/BKash.png'});
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Image.asset(
                'assets/images/Nagad.png',
                scale: 20,
              ),
              title: Text(
                'Nagad',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                  color: Color(0xFF003366),
                ),
              ),
              onTap: () {
                onSelectMethod(
                    {'method': 'Nagad', 'image': 'assets/images/Nagad.png'});
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
