import 'package:flutter/material.dart';

enum PackageType { basic, extra, super_, plus }

class Package {
  final String title;
  final double price;
  final PackageType packageType;
  final List<PlanFeature> features;

  Package({
    required this.title,
    required this.price,
    required this.packageType,
    required this.features,
  });

  List<PlanFeature> getFeatures() => features;
}

class PlanFeature {
  final String text;
  final IconData icon;
  final String? note;
  final bool highlight;
  final String? badge;

  PlanFeature({
    required this.text,
    required this.icon,
    this.note,
    this.highlight = false,
    this.badge,
  });
}
