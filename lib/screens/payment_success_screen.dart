import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

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
            Lottie.asset('assets/anim/payment_success_anim.json',height: 200),
            Text(
              'Payment Success!',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color(0xFF003366),
              ),
            ),
            SizedBox(height: 10,),
            Text(
              'Your product will be shipped soon!',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF003366).withOpacity(0.7),
              ),
            ),
            SizedBox(height: 20,),
            SizedBox(
              width: 300,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> BottomNavBar()));},
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(
                          Color(0xFF003366).withOpacity(0.8)),
                      foregroundColor:
                      WidgetStateProperty.all<Color>(Colors.white),
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(13),
                      child: Text(
                        'Continue Shopping',
                        style:
                        TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
