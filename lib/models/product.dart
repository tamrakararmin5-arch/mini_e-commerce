class Product {
  final String name;
  final String category;
  final String image; // network URL or local asset path
  final double price;
  final double rating;
  final String description;
  final int? discountPercent; // e.g. 20 means 20% off
  final bool isNew;

  const Product({
    required this.name,
    required this.category,
    required this.image,
    required this.price,
    required this.rating,
    required this.description,
    this.discountPercent,
    this.isNew = false,
  });

  bool get hasDiscount => discountPercent != null && discountPercent! > 0;

  /// Price after discount (same as price if there is no discount).
  double get finalPrice =>
      hasDiscount ? price * (1 - discountPercent! / 100) : price;
}
