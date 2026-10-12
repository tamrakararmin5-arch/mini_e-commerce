import 'package:flutter/material.dart';

import '../models/product.dart';
import '../widgets/product_image.dart';

class ProductDetailsPage extends StatelessWidget {
  final Product product;

  const ProductDetailsPage({super.key, required this.product});

  Widget _buildStars() {
    return Row(
      children: List.generate(5, (i) {
        IconData icon;
        if (product.rating >= i + 1) {
          icon = Icons.star;
        } else if (product.rating >= i + 0.5) {
          icon = Icons.star_half;
        } else {
          icon = Icons.star_border;
        }
        return Icon(icon, color: Colors.amber, size: 20);
      }),
    );
  }

  void _addToCart(BuildContext context) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text('${product.name} added to cart'),
          duration: const Duration(seconds: 2),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Product Details')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: ProductImage(path: product.image),
              ),
            ),
            const SizedBox(height: 16),
            Chip(
              label: Text(product.category),
              avatar: const Icon(Icons.category_outlined, size: 18),
            ),
            const SizedBox(height: 8),
            Text(
              product.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                _buildStars(),
                const SizedBox(width: 8),
                Text(
                  product.rating.toStringAsFixed(1),
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '\$${product.finalPrice.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: scheme.primary,
                  ),
                ),
                if (product.hasDiscount) ...[
                  const SizedBox(width: 10),
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    '${product.discountPercent}% OFF',
                    style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Description',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Text(
              product.description,
              style: const TextStyle(fontSize: 15, height: 1.4),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            height: 50,
            child: ElevatedButton.icon(
              onPressed: () => _addToCart(context),
              icon: const Icon(Icons.add_shopping_cart),
              label: const Text('Add to Cart'),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
