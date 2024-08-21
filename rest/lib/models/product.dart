class Product {
  final int id;
  final String name;
  final int price;
  final int quantity;
  final String description;
  final String manufacturer;
  final String category;
  final String condition;
  final String imageUrl;

  Product({
    required this.name,
    required this.id,
    required this.description,
    required this.price,
    required this.category,
    required this.condition,
    required this.manufacturer,
    required this.quantity,
    required this.imageUrl,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    String imageUrl = json['image'].replaceFirst('localhost', '10.0.2.2');

    return Product(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      description: json['description'],
      category: json['category'],
      condition: json['condition'],
      manufacturer: json['manufacturer'],
      quantity: json['quantity'],
      imageUrl: imageUrl,
    );
  }
}
