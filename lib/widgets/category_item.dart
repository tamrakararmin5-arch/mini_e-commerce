import 'package:flutter/material.dart';

import '../models/category.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  final VoidCallback onTap;

  const CategoryItem({super.key, required this.category, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: scheme.primaryContainer,
              child: Icon(category.icon,
                  size: 28, color: scheme.onPrimaryContainer),
            ),
            const SizedBox(height: 6),
            Text(
              category.name,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
