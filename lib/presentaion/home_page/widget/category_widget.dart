import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:storee/domain/models/category.dart';

class CategoryView extends StatefulWidget {
  final bool isLoading;
  List<Category> data;
  int selectedIndex = 0;
  final Function(Category) onSelect;

  CategoryView({
    Key? key,
    required this.isLoading,
    required this.data,
    required this.onSelect,
  }) : super(key: key) {
    if (isLoading) {
      data = List.filled(5, 0)
          .map((e) => Category.empty())
          .toList();
    }
  }

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: widget.data.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            widget.onSelect(widget.data[index]);
            setState(() {
              widget.selectedIndex = index;
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: item(index),
          ),
        );
      },
    );
  }

  Widget item(int index) {
    if (widget.isLoading) {
      return loadingItem();
    } else if (widget.selectedIndex == index) {
      return selectedItem(index);
    } else {
      return unselectedItem(index);
    }
  }

  Widget selectedItem(int index) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.tertiaryContainer,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            FontAwesomeIcons.check,
            size: 15,
          ),
          const SizedBox(
            width: 3,
          ),
          Text(widget.data[index].name),
        ],
      ),
    );
  }

  Widget unselectedItem(int index) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.tertiaryContainer,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(widget.data[index].name),
    );
  }

  Widget loadingItem() {
    return Shimmer(
      colorOpacity: 1,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        width: 50,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.tertiaryContainer,
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
