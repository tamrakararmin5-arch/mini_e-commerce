import 'package:flutter/material.dart';

/// Simple placeholder cart page.
/// Cart management isn't required by the assignment, so this just
/// shows an empty-cart state.
class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Cart')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.shopping_cart_outlined,
                size: 80, color: Colors.grey.shade400),
            const SizedBox(height: 16),
            const Text(
              'Your cart is empty',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            const Text(
              'Items you add will appear here.',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}