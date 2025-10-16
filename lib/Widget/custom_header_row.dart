import 'package:flutter/material.dart';

class CustomHeaderRow extends StatelessWidget {
  final String? mainText;
  final Widget? mainIcon;
  final Color? mainTextColor;
  final double mainTextSize;
  final String rightTitle;
  final String rightSubtitle;
  final Widget? icon;
  final String? imagePath;

  const CustomHeaderRow({
    super.key,
    this.mainText,
    this.mainTextColor,
    this.mainTextSize = 18,
    required this.rightTitle,
    required this.rightSubtitle,
    this.icon,
    this.imagePath,
    this.mainIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (mainIcon != null) mainIcon!,
        if (mainText != null)
          Text(
            mainText!,
            style: TextStyle(
              color: mainTextColor ?? Colors.black,
              fontSize: mainTextSize,
              fontFamily: 'Tajawal-bold',
            ),
          ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    rightTitle,
                    style: TextStyle(fontFamily: 'Tajawal-bold', fontSize: 16),
                  ),
                  Text(
                    rightSubtitle,
                    style: TextStyle(
                      fontFamily: 'Tajawal-medium',
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            if (icon != null) icon!,
            if (imagePath != null)
              Image.asset(
                imagePath!,
                width: 24,
                height: 24,
                fit: BoxFit.contain,
              ),
          ],
        ),
      ],
    );
  }
}
