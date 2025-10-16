class CategoryModel {
  final int? id;              
  final String image;
  final String title;

  CategoryModel({
    this.id,                 
    required this.image, 
    required this.title
  });

  // Add database support
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': title,
      'image': image,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'] as int?,
      title: map['name'] as String,
      image: map['image'] as String,
    );
  }
}