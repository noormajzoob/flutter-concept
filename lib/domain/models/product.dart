import 'package:flutter/foundation.dart';

import 'package:storee/domain/models/category.dart' as ct;

class Product {
  final int id;
  final String title;
  final double price;
  final ct.Category category;
  final List<String> images;

  Product(
      {required this.id,
      required this.title,
      required this.price,
      required this.category,
      required this.images});

  factory Product.empty() => Product(
        id: 1,
        title: '',
        price: 0,
        category: ct.Category.empty(),
        images: [],
      );
}
