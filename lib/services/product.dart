class Product {
  final String title;
  final String image;
  final double price;


  const Product({
    required this.title,
    required this.image,
    required this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      title: json['title'],
      image: json['image'],
      price: json['price'],
    );
  }
}