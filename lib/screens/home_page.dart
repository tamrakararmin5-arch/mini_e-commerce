import 'package:flutter/material.dart';

import '../data/product_data.dart';
import '../widgets/banner_carousel.dart';
import '../widgets/category_item.dart';
import '../widgets/product_card.dart';
import 'cart_page.dart';
import 'category_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _openCategory(BuildContext context, String name) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => CategoryPage(categoryName: name),
      ),
    );
  }

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.shopping_bag),
            SizedBox(width: 8),
            Text('MyShop', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => _showMessage(context, 'Search coming soon'),
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const CartPage()),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            const BannerCarousel(),

            // Categories (horizontal scrolling)
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 20, 16, 8),
              child: Text(
                'Shop by Category',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: categories
                    .map(
                      (c) => CategoryItem(
                    category: c,
                    onTap: () => _openCategory(context, c.name),
                  ),
                )
                    .toList(),
              ),
            ),

            // Popular products
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 8, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Popular Products',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () => _openCategory(context, 'All'),
                    child: const Text('See All →'),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 285,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: products.length,
                separatorBuilder: (context, index) => const SizedBox(width: 12),
                itemBuilder: (context, index) => SizedBox(
                  width: 170,
                  child: ProductCard(product: products[index]),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}