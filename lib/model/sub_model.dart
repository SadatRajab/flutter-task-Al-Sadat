
import 'package:flutter/material.dart';

class PlanFeature {
  final String text;
  final IconData icon;
  final String? note;
  final bool highlight;
  final String? badge;

  const PlanFeature({
    required this.text,
    required this.icon,
    this.note,
    this.highlight = false,
    this.badge,
  });
}
//  PackageItem(
//         id: 1,
//         title: 'سياسية',
//         price: 'ج.م 3,000',
//         description: 'مميزة الإعلان 30 يوم',
//         features: [
//           'ترتيب فى كل القائمات فمقدم',
//           'الحين فى كل التقسيمات فمصر',
//         ],
//       ),
//       PackageItem(
//         id: 2,
//         title: 'قمسوس',
//         price: 'ج.م 3,000',
//         description: 'مميزة الإعلان 30 يوم',
//         features: [
//           'رفع الإعلان تلقائيا كل 3 أيام',
//           'ترتيب فى كل القائمات فمقدم',
//           'الحين فى كل التقسيمات فمصر',
//         ],
//         discount: 'وفر ج.م 400 بدل من 3400',
//         isSelected: true,
//       ),
//       PackageItem(
//         id: 3,
//         title: 'قمسوس',
//         price: 'ج.م 3,000',
//         description: 'مميزة الإعلان 30 يوم',
//         features: [
//           'ترتيب فى كل القائمات فمقدم',
//           'الحين فى كل التقسيمات فمصر',
//         ],
//         isSelected: false,
//       ),
//       PackageItem(
//         id: 4,
//         title: 'مميز',
//         price: 'ج.م 3,000',
//         description: 'مميزة الإعلان 30 يوم',
//         features: [
//           'ترتيب فى كل القائمات فمقدم',
//           'الحين فى كل التقسيمات فمصر',
//         ],
//         isSelected: false,
//       ),