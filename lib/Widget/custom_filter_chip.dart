import 'package:flutter/material.dart';

class CustomFilterChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const CustomFilterChip({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(
        label,
        style: TextStyle(
          fontFamily: 'Tajawal-medium',
          color: selected ? Color(0xff3b4cf2) : Colors.grey.shade700,
          fontSize: 16,
        ),
      ),
      showCheckmark: false,
      selected: selected,
      onSelected: (_) => onTap(),
      backgroundColor: Colors.white,
      selectedColor: Color(0xffeaf3fe),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: BorderSide(
          color: selected ? Color(0xff3b4cf2) : Colors.grey.shade300,
          width: 1.5,
        ),
      ),
      elevation: 0,
      pressElevation: 0,
    );
  }
}
