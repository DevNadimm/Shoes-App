import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../widgets/common/custom_elevated_button.dart';
import '../widgets/nav/bottom_nav_bar.dart';

class PaymentSuccessScreen extends StatelessWidget {
  const PaymentSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset('assets/anim/payment_success_anim.json', height: 200),
            Text(
              'Payment Success!',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color(0xFF003366),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Your product will be shipped soon!',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF003366).withOpacity(0.7),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CustomElevatedButton(
              label: 'Continue Shopping',
              width: 250,
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => BottomNavBar(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
