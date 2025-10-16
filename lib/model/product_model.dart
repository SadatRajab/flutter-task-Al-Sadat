class Product {
  final int? id;
  final String name;
  final String? description;
  final double price;
  final double? oldPrice;           // For showing discounts
  final String imagePath;           // Product image path
  final int? categoryId;
  final int? salesCount;            // Track popularity
  final bool isFavorite;            // User's favorite status

  Product({
    this.id,
    required this.name,
    this.description,
    required this.price,
    this.oldPrice,
    required this.imagePath,
    this.categoryId,
    this.salesCount,
    this.isFavorite = false,
  });

  // Convert Product to Map for database insertion
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'oldPrice': oldPrice,
      'imagePath': imagePath,
      'categoryId': categoryId,
      'salesCount': salesCount,
      'isFavorite': isFavorite ? 1 : 0,  
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as int?,
      name: map['name'] as String,
      description: map['description'] as String?,
      price: (map['price'] as num).toDouble(),
      oldPrice: map['oldPrice'] != null ? (map['oldPrice'] as num).toDouble() : null,
      imagePath: map['imagePath'] as String,
      categoryId: map['categoryId'] as int?,
      salesCount: map['salesCount'] as int?,
      isFavorite: (map['isFavorite'] as int?) == 1,
    );
  }

  Product copyWith({
    int? id,
    String? name,
    String? description,
    double? price,
    double? oldPrice,
    String? imagePath,
    int? categoryId,
    int? salesCount,
    bool? isFavorite,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      oldPrice: oldPrice ?? this.oldPrice,
      imagePath: imagePath ?? this.imagePath,
      categoryId: categoryId ?? this.categoryId,
      salesCount: salesCount ?? this.salesCount,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  String get formattedSalesCount {
    if (salesCount == null || salesCount == 0) return '';
    if (salesCount! >= 1000) {
      return '+${(salesCount! / 1000).toStringAsFixed(1)}k تم بيع';
    }
    return '+$salesCount تم بيع';
  }

  @override
  String toString() {
    return 'Product{id: $id, name: $name, price: $price, imagePath: $imagePath}';
  }
}