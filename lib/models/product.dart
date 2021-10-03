class Product {
  final String? id;
  final String? title;
  final String? description;
  final double? price;
  final String? imageUrl;
  final String? brand;
  final String? productCategoryName;
  final int? quantity;
  final bool isPopular;

  Product({
    this.id,
    this.title,
    this.description,
    this.price,
    this.imageUrl,
    this.brand,
    this.productCategoryName,
    this.quantity,
    this.isPopular = false,
  });
}
