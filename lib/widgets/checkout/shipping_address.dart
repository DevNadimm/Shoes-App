import 'package:flutter/material.dart';
import 'package:shop_app/widgets/checkout/section_row.dart';
import 'package:shop_app/widgets/checkout/shipping_address_bottom_sheet.dart';
import 'package:shop_app/widgets/checkout/shipping_address_row.dart';

class ShippingAddress extends StatefulWidget {
  @override
  _ShippingAddressState createState() => _ShippingAddressState();
}

class _ShippingAddressState extends State<ShippingAddress> {
  String name = 'Nadim Chowdhury';
  String phone = '+8801944557101';
  String address =
      'Green Haven Hills, Road No. 12, Green Valley, Chittagong, Bangladesh';
  String email = 'nadim@gmail.com';

  InputDecoration commonDecoration(String hintText) {
    return InputDecoration(
      hintText: hintText,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      fillColor: Color(0xFF003366).withOpacity(0.1),
      filled: true,
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return ShippingAddressBottomSheet(
          initialName: name,
          initialPhone: phone,
          initialEmail: email,
          initialAddress: address,
          onUpdate: (newName, newPhone, newEmail, newAddress) {
            setState(() {
              name = newName;
              phone = newPhone;
              email = newEmail;
              address = newAddress;
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionRow(
          title: 'Shipping Address',
          action: 'Change',
          actionOpacity: 0.8,
          onTap: () {
            _showBottomSheet(context);
          },
        ),
        const SizedBox(height: 16),
        ShippingAddressRow(value: name, icon: Icons.person_rounded),
        const SizedBox(height: 5),
        ShippingAddressRow(value: phone, icon: Icons.call_rounded),
        const SizedBox(height: 5),
        ShippingAddressRow(value: email, icon: Icons.email_rounded),
        const SizedBox(height: 5),
        ShippingAddressRow(value: address, icon: Icons.location_on_rounded),
      ],
    );
  }
}
