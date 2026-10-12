import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../data/product_data.dart';
import '../screens/category_page.dart';
import 'product_image.dart';

/// Promotional banner carousel using the carousel_slider package.
class BannerCarousel extends StatefulWidget {
  const BannerCarousel({super.key});

  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 170,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 4),
            enlargeCenterPage: true,
            viewportFraction: 0.9,
            onPageChanged: (index, reason) => setState(() => _current = index),
          ),
          items: banners.map((banner) {
            return GestureDetector(
              // Each banner "links" to its category page.
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CategoryPage(categoryName: banner.categoryName),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    ProductImage(path: banner.image),
                    Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [Colors.black87, Colors.transparent],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            banner.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            banner.subtitle,
                            style: const TextStyle(
                                color: Colors.white70, fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(banners.length, (i) {
            final active = i == _current;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              margin: const EdgeInsets.symmetric(horizontal: 3),
              width: active ? 18 : 8,
              height: 8,
              decoration: BoxDecoration(
                color: active ? scheme.primary : Colors.grey.shade400,
                borderRadius: BorderRadius.circular(4),
              ),
            );
          }),
        ),
      ],
    );
  }
}
