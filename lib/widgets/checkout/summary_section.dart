import 'package:flutter/material.dart';
import 'package:shop_app/widgets/checkout/checkout_container_row.dart';
import 'package:shop_app/widgets/checkout/payment_method_row.dart';
import 'package:shop_app/widgets/checkout/section_row.dart';
import 'package:shop_app/widgets/checkout/shipping_address.dart';

const Color primaryColor = Color(0xFF003366);
const double padding = 16.0;
const double smallPadding = 8.0;
const double largePadding = 20.0;

class SummarySection extends StatefulWidget {
  final double subTotal;
  final double shippingCost;
  final double taxAmount;
  final double discount;
  final double orderTotal;

  SummarySection({
    required this.subTotal,
    required this.shippingCost,
    required this.taxAmount,
    required this.discount,
    required this.orderTotal,
  });

  @override
  State<SummarySection> createState() => _SummarySectionState();
}

class _SummarySectionState extends State<SummarySection> {
  String _selectedPaymentMethod = 'Google Pay';
  String _selectedPaymentImage = 'assets/images/gPay.png';

  void _changePaymentMethod() async {
    final result = await showDialog<Map<String, String>>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text(
            'Select Payment Method',
            style: TextStyle(
                fontWeight: FontWeight.w600, color: Color(0xFF003366)),
          ),
          children: [
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, {
                  'method': 'Google Pay',
                  'image': 'assets/images/gPay.png'
                });
              },
              child: PaymentMethodRow(
                  imagePath: 'assets/images/gPay.png',
                  methodName: 'Google Pay'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, {
                  'method': 'Credit Card',
                  'image': 'assets/images/credit_card.png'
                });
              },
              child: PaymentMethodRow(
                  imagePath: 'assets/images/credit_card.png',
                  methodName: 'Credit Card'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context,
                    {'method': 'BKash', 'image': 'assets/images/BKash.png'});
              },
              child: PaymentMethodRow(
                  imagePath: 'assets/images/BKash.png', methodName: 'BKash'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context,
                    {'method': 'Nagad', 'image': 'assets/images/Nagad.png'});
              },
              child: PaymentMethodRow(
                  imagePath: 'assets/images/Nagad.png', methodName: 'Nagad'),
            ),
          ],
        );
      },
    );

    if (result != null) {
      setState(() {
        _selectedPaymentMethod = result['method']!;
        _selectedPaymentImage = result['image']!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(padding),
      margin: const EdgeInsets.symmetric(horizontal: padding),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: primaryColor.withOpacity(0.3),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CheckoutContainerRow(
            label: 'Subtotal',
            value: '\$${widget.subTotal.toStringAsFixed(2)}',
          ),
          const SizedBox(height: 5),
          CheckoutContainerRow(
            label: 'Shipping',
            value: '\$${widget.shippingCost.toStringAsFixed(2)}',
          ),
          const SizedBox(height: 5),
          CheckoutContainerRow(
            label: 'Tax',
            value: '\$${widget.taxAmount.toStringAsFixed(2)}',
          ),
          const SizedBox(height: 5),
          CheckoutContainerRow(
            label: 'Discount',
            value: '-\$${widget.discount.toStringAsFixed(2)}',
          ),
          const SizedBox(height: padding),
          Divider(color: primaryColor.withOpacity(0.3), thickness: 2),
          const SizedBox(height: padding),
          CheckoutContainerRow(
            label: 'Total',
            value: '\$${widget.orderTotal.toStringAsFixed(2)}',
          ),
          const SizedBox(height: padding),
          Divider(color: primaryColor.withOpacity(0.3), thickness: 2),
          const SizedBox(height: padding),
          SectionRow(
            title: 'Payment Method',
            action: 'Change',
            actionOpacity: 0.8,
            onTap: _changePaymentMethod,
          ),
          const SizedBox(height: largePadding),
          PaymentMethodRow(
            imagePath: _selectedPaymentImage,
            methodName: _selectedPaymentMethod,
          ),
          const SizedBox(height: largePadding),
          ShippingAddress(),
        ],
      ),
    );
  }
}
