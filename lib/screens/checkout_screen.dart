import 'package:flutter/material.dart';
import 'package:shop_app/screens/payment_success_screen.dart';
import 'package:shop_app/widgets/checkout/selected_products_list.dart';
import 'package:shop_app/widgets/checkout/discount_field.dart';
import '../widgets/checkout/location_selector.dart';
import '../widgets/checkout/summary_section.dart';
import '../widgets/common/custom_elevated_button.dart';

class CheckoutScreen extends StatefulWidget {
  CheckoutScreen({Key? key, required this.subTotal}) : super(key: key);
  final double subTotal;

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final TextEditingController _couponController = TextEditingController();
  String selectedLocation = 'Dhaka';
  double taxPercentage = 5;
  double discount = 0;

  double getShippingCost() {
    return selectedLocation == 'Dhaka' ? 5 : 7;
  }

  double getTaxAmount() {
    return widget.subTotal * (taxPercentage / 100);
  }

  double getOrderTotal() {
    return widget.subTotal + getShippingCost() + getTaxAmount() - discount;
  }

  void applyDiscount(double discountValue) {
    setState(() {
      discount = discountValue;
    });
  }

  void updateLocation(String location) {
    setState(() {
      selectedLocation = location;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Checkout',
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
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SelectedProductsList(),
                    const SizedBox(height: 20),
                    DiscountField(
                      controller: _couponController,
                      applyDiscount: applyDiscount,
                      subTotal: widget.subTotal,
                    ),
                    const SizedBox(height: 20),
                    LocationSelector(
                      selectedLocation: selectedLocation,
                      updateLocation: updateLocation,
                    ),
                    const SizedBox(height: 20),
                    SummarySection(
                      subTotal: widget.subTotal,
                      shippingCost: getShippingCost(),
                      taxAmount: getTaxAmount(),
                      discount: discount,
                      orderTotal: getOrderTotal(),
                    ),
                    const SizedBox(height: 5),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: CustomElevatedButton(
                label: 'Checkout \$${getOrderTotal().toStringAsFixed(2)}',
                width: double.infinity,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PaymentSuccessScreen(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
