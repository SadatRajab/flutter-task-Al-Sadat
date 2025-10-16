import 'package:shope_taske/model/sub_model.dart';
import 'package:shope_taske/model/features_data_model.dart';

class Package {
  final int? id;
  final String title;
  final String description;
  final double price;
  final int duration;
  final String packageType;
  final List<PlanFeature> features;

  Package({
    this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.duration,
    required this.packageType,
    required this.features,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'duration': duration,
      'packageType': packageType,
    };
  }

  factory Package.fromMap(
    Map<String, dynamic> map,
    List<PlanFeature> features,
  ) {
    return Package(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      price: map['price'],
      duration: map['duration'],
      packageType: map['packageType'],
      features: features,
    );
  }
}
