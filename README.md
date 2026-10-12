# MyShop – Mini E-Commerce App (Flutter)

**Student Name:** Armin Tamrakar
**Student ID:** 2510412276
**Course:** Mobile Application Development – Flutter

---

## Description

MyShop is a simple multi-screen shopping application built with Flutter.
Users can browse products from the home page, open a category to see its
products in a grid, and open any product to view its full details.

The app uses static/local product data only. There is no backend, login,
database or payment, as per the assignment requirements.

## Features

- **Home page** with an AppBar (app name/logo, search icon and cart icon)
- **Promotional banner carousel** with 3 auto-playing banners, each linking to a category
- **Horizontally scrolling category list** (Electronics, Fashion, Shoes, Beauty, Accessories, Home)
- **Popular Products** section with a "See All →" button
- **Reusable `ProductCard` widget** using `Card`, `Container` and `Stack`, with discount/"New" badges, a favorite heart icon and a "View Details" button
- **Category page** that receives the selected category name and shows its products using `GridView.builder`
- **Product details page** showing image, name, category, rating, price, description and an "Add to Cart" button (shows a SnackBar)
- **Cart page** showing an empty-cart message
- 12 products across 6 categories

## Packages Used

| Package | Purpose |
|---|---|
| [carousel_slider](https://pub.dev/packages/carousel_slider) | Creates the auto-playing promotional banner carousel on the home page |

I used `carousel_slider` because it provides a ready-made, customizable
carousel (auto-play, page-change callback, enlarged center item) so I did not
have to build the sliding logic from scratch.

## Project Structure

```
lib/
├── main.dart
├── models/
│   ├── product.dart
│   ├── category.dart
│   └── promo_banner.dart
├── screens/
│   ├── home_page.dart
│   ├── category_page.dart
│   ├── product_details_page.dart
│   └── cart_page.dart
├── widgets/
│   ├── product_card.dart
│   ├── category_item.dart
│   ├── banner_carousel.dart
│   └── product_image.dart
└── data/
    └── product_data.dart
```

## Screenshots

| Home Page | Category Page | Product Details Page |
|:---:|:---:|:---:|
| <img src="https://github.com/user-attachments/assets/b3c9684e-327b-4db8-b9fa-efd7bba696b8" width="250" alt="Home Page"> | <img src="https://github.com/user-attachments/assets/9fe58c89-4c67-41b0-9174-27f540583a07" width="250" alt="Category Page"> | <img src="https://github.com/user-attachments/assets/7af7046e-56c1-4f5a-ab61-c85aae314976" width="250" alt="Product Details Page"> |

## How to Run

1. Make sure [Flutter](https://docs.flutter.dev/get-started/install) is installed.
2. Clone the repository:
   ```bash
   git clone https://github.com/tamrakararmin5-arch/mini_e-commerce.git
   cd mini_e-commerce
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Connect a device or start an emulator, then run:
   ```bash
   flutter run
   ```

> An internet connection is required because product and banner images are
> loaded from the web.
