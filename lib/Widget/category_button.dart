import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryButton({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          backgroundColor: isSelected
              ? const Color(0xFFFFF6F0)
              : const Color(0xFFF5F5F5),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          side: isSelected
              ? const BorderSide(color: Colors.deepOrange)
              : BorderSide(color: Colors.grey.shade400),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.deepOrange : Colors.grey[700],
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily: 'Tajawal-medium',
          ),
        ),
      ),
    );
  }
}
