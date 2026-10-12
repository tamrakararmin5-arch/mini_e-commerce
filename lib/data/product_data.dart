import 'package:flutter/material.dart';

import '../models/category.dart';
import '../models/product.dart';
import '../models/promo_banner.dart';

const List<Category> categories = [
  Category(name: 'Electronics', icon: Icons.devices),
  Category(name: 'Fashion', icon: Icons.checkroom),
  Category(name: 'Shoes', icon: Icons.directions_walk),
  Category(name: 'Beauty', icon: Icons.face_retouching_natural),
  Category(name: 'Accessories', icon: Icons.watch),
  Category(name: 'Home', icon: Icons.chair),
];

const List<PromoBanner> banners = [
  PromoBanner(
    title: 'Summer Sale',
    subtitle: 'Up to 30% off on fashion',
    image: 'https://images.unsplash.com/photo-1483985988355-763728e1935b?w=900&q=80',
    categoryName: 'Fashion',
  ),
  PromoBanner(
    title: 'New Arrivals',
    subtitle: 'Fresh sneakers just landed',
    image: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=900&q=80',
    categoryName: 'Shoes',
  ),
  PromoBanner(
    title: 'Electronics Discount',
    subtitle: 'Gadgets at great prices',
    image: 'https://images.unsplash.com/photo-1498049794561-7780e7231661?w=900&q=80',
    categoryName: 'Electronics',
  ),
];

const List<Product> products = [
  // Electronics
  Product(
    name: 'Wireless Headphones',
    category: 'Electronics',
    image: 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=600&q=80',
    price: 59.99,
    rating: 4.5,
    discountPercent: 20,
    description:
    'Over-ear wireless headphones with deep bass, active noise reduction '
        'and up to 30 hours of battery life.',
  ),
  Product(
    name: 'Smart Watch',
    category: 'Electronics',
    image: 'https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=600&q=80',
    price: 129.99,
    rating: 4.3,
    isNew: true,
    description:
    'Track your steps, heart rate and sleep. Water resistant with a bright '
        'AMOLED display and notifications on your wrist.',
  ),
  // Fashion
  Product(
    name: 'Cotton T-Shirt',
    category: 'Fashion',
    image: 'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=600&q=80',
    price: 19.99,
    rating: 4.1,
    description:
    'Soft, breathable 100% cotton t-shirt with a relaxed fit. Perfect for '
        'everyday wear.',
  ),
  Product(
    name: 'Denim Jacket',
    category: 'Fashion',
    image: 'https://images.unsplash.com/photo-1551028719-00167b16eac5?w=600&q=80',
    price: 79.99,
    rating: 4.6,
    discountPercent: 30,
    description:
    'Classic denim jacket with a modern cut. Durable, comfortable and easy '
        'to style with anything.',
  ),
  // Shoes
  Product(
    name: 'Running Sneakers',
    category: 'Shoes',
    image: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=600&q=80',
    price: 89.99,
    rating: 4.7,
    isNew: true,
    description:
    'Lightweight running sneakers with cushioned soles and a breathable '
        'mesh upper for all-day comfort.',
  ),
  Product(
    name: 'Leather Boots',
    category: 'Shoes',
    image: 'https://images.unsplash.com/photo-1608256246200-53e635b5b65f?w=600&q=80',
    price: 119.99,
    rating: 4.4,
    description:
    'Premium leather boots built to last, with a sturdy grip sole and '
        'timeless style.',
  ),
  // Beauty
  Product(
    name: 'Moisturizing Cream',
    category: 'Beauty',
    image: 'https://images.unsplash.com/photo-1556228720-195a672e8a03?w=600&q=80',
    price: 24.99,
    rating: 4.2,
    description:
    'Daily face cream with hyaluronic acid that keeps your skin soft and '
        'hydrated for 24 hours.',
  ),
  Product(
    name: 'Matte Lipstick',
    category: 'Beauty',
    image: 'https://images.unsplash.com/photo-1512496015851-a90fb38ba796?w=600&q=80',
    price: 14.99,
    rating: 4.0,
    discountPercent: 10,
    description:
    'Long-lasting matte lipstick with a smooth, non-drying finish in a '
        'bold shade.',
  ),
  // Accessories
  Product(
    name: 'Sunglasses',
    category: 'Accessories',
    image: 'https://images.unsplash.com/photo-1572635196237-14b3f281503f?w=600&q=80',
    price: 34.99,
    rating: 4.3,
    description:
    'UV400 protection sunglasses with a lightweight frame and polarized '
        'lenses.',
  ),
  Product(
    name: 'Travel Backpack',
    category: 'Accessories',
    image: 'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=600&q=80',
    price: 49.99,
    rating: 4.6,
    isNew: true,
    description:
    'Water-resistant backpack with a padded laptop compartment and plenty '
        'of pockets for travel or school.',
  ),
  // Home
  Product(
    name: 'Table Lamp',
    category: 'Home',
    image: 'https://images.unsplash.com/photo-1507473885765-e6ed057f782c?w=600&q=80',
    price: 39.99,
    rating: 4.4,
    description:
    'Minimal table lamp with warm light and an adjustable neck. Great for '
        'desks and bedside tables.',
  ),
  Product(
    name: 'Ceramic Mug Set',
    category: 'Home',
    image: 'https://images.unsplash.com/photo-1514228742587-6b1558fcca3d?w=600&q=80',
    price: 22.99,
    rating: 4.5,
    discountPercent: 15,
    description:
    'Set of four handmade-style ceramic mugs. Microwave and dishwasher '
        'safe.',
  ),
];