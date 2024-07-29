import 'package:flutter/material.dart';

class ShippingAddressBottomSheet extends StatefulWidget {
  final String initialName;
  final String initialPhone;
  final String initialEmail;
  final String initialAddress;
  final void Function(String, String, String, String) onUpdate;

  const ShippingAddressBottomSheet({
    Key? key,
    required this.initialName,
    required this.initialPhone,
    required this.initialEmail,
    required this.initialAddress,
    required this.onUpdate,
  }) : super(key: key);

  @override
  _ShippingAddressBottomSheetState createState() =>
      _ShippingAddressBottomSheetState();
}

class _ShippingAddressBottomSheetState
    extends State<ShippingAddressBottomSheet> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.initialName;
    phoneController.text = widget.initialPhone;
    emailController.text = widget.initialEmail;
    addressController.text = widget.initialAddress;
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    addressController.dispose();
    super.dispose();
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

  void updateInfo() {
    widget.onUpdate(
      nameController.text,
      phoneController.text,
      emailController.text,
      addressController.text,
    );
    Navigator.pop(context);
  }

  Widget _textField({
    required TextEditingController controller,
    required String hintText,
  }) {
    return TextField(
      controller: controller,
      decoration: commonDecoration(hintText),
      style: TextStyle(
        color: const Color(0xFF003366),
        fontWeight: FontWeight.w600,
      ),
    );
  }

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
            _textField(
              controller: nameController,
              hintText: 'Name',
            ),
            const SizedBox(height: 10),
            _textField(
              controller: phoneController,
              hintText: 'Phone Number',
            ),
            const SizedBox(height: 10),
            _textField(
              controller: emailController,
              hintText: 'Email',
            ),
            const SizedBox(height: 10),
            _textField(
              controller: addressController,
              hintText: 'Address',
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: updateInfo,
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
                      fontWeight: FontWeight.w700,
                      fontSize: 17,
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