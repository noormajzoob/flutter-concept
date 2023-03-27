import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:storee/domain/models/product.dart';
import 'package:storee/presentaion/home_page/widget/product_item.dart';

class ProductListWidget extends StatefulWidget {
  List<Product> products;
  final bool isLoading;
  final void Function(Product) onItemClick;

  ProductListWidget({
    Key? key,
    required this.products,
    required this.isLoading,
    required this.onItemClick,
  }) : super(key: key) {
    if (isLoading) {
      products = List.filled(6, 0).map((e) => Product.empty()).toList();
    }
  }

  @override
  State<ProductListWidget> createState() => _ProductListWidgetState();
}

class _ProductListWidgetState extends State<ProductListWidget> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 6,
          mainAxisSpacing: 6,
          childAspectRatio: .75),
      itemCount: widget.products.length,
      itemBuilder: (BuildContext context, int index) {
        return Hero(
          tag: '${widget.products[index].id}',
          child: item(index),
        );
      },
    );
  }

  Widget item(int index) {
    if (widget.isLoading) {
      return Shimmer(
        colorOpacity: 0.8,
        child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondaryContainer,
              borderRadius: BorderRadius.circular(16)),
        ),
      );
    } else {
      return ProductItem(
        product: widget.products[index],
        click: () {
          widget.onItemClick(widget.products[index]);
        },
      );
    }
  }
}
