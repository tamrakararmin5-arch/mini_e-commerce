import 'package:flutter/material.dart';

/// Shows a product image from a network URL or a local asset path,
/// with a loading spinner and an error fallback.
class ProductImage extends StatelessWidget {
  final String path;
  final BoxFit fit;

  const ProductImage({super.key, required this.path, this.fit = BoxFit.cover});

  @override
  Widget build(BuildContext context) {
    Widget fallback() => Container(
      color: Colors.grey.shade200,
      alignment: Alignment.center,
      child: const Icon(Icons.image_not_supported_outlined,
          color: Colors.grey),
    );

    if (path.startsWith('http')) {
      return Image.network(
        path,
        fit: fit,
        width: double.infinity,
        height: double.infinity,
        loadingBuilder: (context, child, progress) {
          if (progress == null) return child;
          return Container(
            color: Colors.grey.shade100,
            alignment: Alignment.center,
            child: const SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          );
        },
        errorBuilder: (context, error, stack) => fallback(),
      );
    }

    return Image.asset(
      path,
      fit: fit,
      width: double.infinity,
      height: double.infinity,
      errorBuilder: (context, error, stack) => fallback(),
    );
  }
}
