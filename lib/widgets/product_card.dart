import 'package:flutter/material.dart';

import '../models/product.dart';
import '../screens/product_details_page.dart';
import 'product_image.dart';

/// Reusable product card. The parent decides the size (width/height).
class ProductCard extends StatefulWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool _isFavorite = false;

  void _openDetails() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ProductDetailsPage(product: widget.product),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: InkWell(
        onTap: _openDetails,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image area with badges and favorite icon stacked on top.
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ProductImage(path: product.image),
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Row(
                      children: [
                        if (product.hasDiscount)
                          _Badge(
                            text: '-${product.discountPercent}%',
                            color: Colors.red,
                          ),
                        if (product.hasDiscount && product.isNew)
                          const SizedBox(width: 4),
                        if (product.isNew)
                          const _Badge(text: 'New', color: Colors.green),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 6,
                    right: 6,
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.white,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        iconSize: 18,
                        icon: Icon(
                          _isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: _isFavorite ? Colors.red : Colors.black54,
                        ),
                        onPressed: () =>
                            setState(() => _isFavorite = !_isFavorite),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(10, 8, 10, 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        '\$${product.finalPrice.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      if (product.hasDiscount) ...[
                        const SizedBox(width: 6),
                        Text(
                          '\$${product.price.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    height: 32,
                    child: ElevatedButton(
                      onPressed: _openDetails,
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text('View Details',
                          style: TextStyle(fontSize: 12)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  final String text;
  final Color color;

  const _Badge({required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 11,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
