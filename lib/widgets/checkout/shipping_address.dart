import 'package:flutter/material.dart';
import 'package:shop_app/widgets/checkout/section_row.dart';

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

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final emailController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    addressController.dispose();
    emailController.dispose();
    super.dispose();
  }

  void updateInfo() {
    setState(() {
      name = nameController.text.isNotEmpty ? nameController.text : name;
      phone = phoneController.text.isNotEmpty ? phoneController.text : phone;
      address =
          addressController.text.isNotEmpty ? addressController.text : address;
      email = emailController.text.isNotEmpty ? emailController.text : email;
    });
  }

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
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: commonDecoration('Name'),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: phoneController,
                  decoration: commonDecoration('Phone Number'),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: emailController,
                  decoration: commonDecoration('Email'),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: addressController,
                  decoration: commonDecoration('Address'),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      updateInfo();
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color(0xFF003366).withOpacity(0.8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(13),
                      child: Text(
                        'Update',
                        style: const TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 17,),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionRow(
          title: 'Shipping Address',
          action: 'Change',
          actionOpacity: 0.8,
          onTap: () {
            _showBottomSheet(context);
          },
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Icon(
              Icons.person,
              color: Color(0xFF003366).withOpacity(0.8),
              size: 17,
            ),
            const SizedBox(width: 15),
            Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15,
                color: Color(0xFF003366),
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            Icon(
              Icons.call,
              color: Color(0xFF003366).withOpacity(0.8),
              size: 17,
            ),
            const SizedBox(width: 15),
            Text(
              phone,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15,
                color: Color(0xFF003366),
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            Icon(
              Icons.email,
              color: Color(0xFF003366).withOpacity(0.8),
              size: 17,
            ),
            const SizedBox(width: 15),
            Text(
              email,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15,
                color: Color(0xFF003366),
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            Icon(
              Icons.location_on,
              color: Color(0xFF003366).withOpacity(0.8),
              size: 17,
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                address,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  color: Color(0xFF003366),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
