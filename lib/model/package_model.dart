import 'package:shope_taske/model/sub_model.dart';
import 'package:shope_taske/model/features_data_model.dart';
class Package {
  final int? id;
  final String title;
  final String? description;
  final double price;
  final int? duration; 
  final String packageType; 

  Package({
    this.id,
    required this.title,
    this.description,
    required this.price,
    this.duration,
    required this.packageType,
  });

  // Convert Package to Map for database insertion
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

  // Create Package from Map (database result)
  factory Package.fromMap(Map<String, dynamic> map) {
    return Package(
      id: map['id'] as int?,
      title: map['title'] as String,
      description: map['description'] as String?,
      price: (map['price'] as num).toDouble(),
      duration: map['duration'] as int?,
      packageType: map['packageType'] as String,
    );
  }

  // Get features based on package type
  List<PlanFeature> getFeatures() {
    switch (packageType.toLowerCase()) {
      case 'plus':
        return featurePlus;
      case 'super':
        return featureSuper;
      case 'extra':
        return featureExtra;
      case 'basic':
        return featrureBasic;
      default:
        return [];
    }
  }

  // Create a copy with updated values
  Package copyWith({
    int? id,
    String? title,
    String? description,
    double? price,
    int? duration,
    String? packageType,
  }) {
    return Package(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
      duration: duration ?? this.duration,
      packageType: packageType ?? this.packageType,
    );
  }

  @override
  String toString() {
    return 'Package{id: $id, title: $title, type: $packageType, price: $price}';
  }
}

