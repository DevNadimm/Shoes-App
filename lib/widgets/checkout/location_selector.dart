import 'package:flutter/material.dart';

class LocationSelector extends StatelessWidget {
  final String selectedLocation;
  final Function(String) updateLocation;

  LocationSelector({
    required this.selectedLocation,
    required this.updateLocation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: const Color(0xFF003366).withOpacity(0.3),
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedLocation,
          onChanged: (String? newValue) {
            if (newValue != null) {
              updateLocation(newValue);
            }
          },
          items: <String>['Dhaka', 'Out of Dhaka']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: TextStyle(color: Color(0xFF003366)),
              ),
            );
          }).toList(),
          icon: Icon(Icons.arrow_drop_down, color: Color(0xFF003366)),
          isExpanded: true,
          dropdownColor: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
