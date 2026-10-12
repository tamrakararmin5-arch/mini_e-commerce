import 'package:flutter/material.dart';

import '../data/product_data.dart';
import '../widgets/product_card.dart';

class CategoryPage extends StatelessWidget {
  final String categoryName; // use 'All' to show every product

  const CategoryPage({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    final filtered = categoryName == 'All'
        ? products
        : products.where((p) => p.category == categoryName).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName == 'All' ? 'All Products' : categoryName),
      ),
      body: filtered.isEmpty
          ? const Center(child: Text('No products in this category yet.'))
          : GridView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: filtered.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 220,
          mainAxisExtent: 275,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
        ),
        itemBuilder: (context, index) =>
            ProductCard(product: filtered[index]),
      ),
    );
  }
}
