import 'package:flutter/material.dart';

class LableContent extends StatelessWidget {
  final String text;
  const LableContent({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      textDirection: TextDirection.rtl,
      text,
      style: TextStyle(
        fontFamily: 'Tajawal-bold',
        fontSize: 17,
        color: Colors.grey.shade400,
      ),
    );
  }
}
