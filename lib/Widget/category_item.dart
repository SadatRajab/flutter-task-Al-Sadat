import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String imagePath;
  final String title;
  const CategoryItem({super.key, required this.imagePath, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Center(child: Image.asset(imagePath, width: 90, fit: BoxFit.cover)),
          SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.5,
              fontWeight: FontWeight.bold,
              fontFamily: 'Tajawal',
            ),
          ),
        ],
      ),
    );
  }
}
