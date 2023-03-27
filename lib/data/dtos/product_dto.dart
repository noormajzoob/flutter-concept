import 'package:json_annotation/json_annotation.dart';
import 'package:storee/data/dtos/category_dto.dart';
import 'package:storee/domain/models/product.dart';
import 'package:storee/domain/models/category.dart' as ct;

part 'product_dto.g.dart';

@JsonSerializable()
class ProductDto extends Product {
  final int id;
  final String title;
  final CategoryDto category;
  final double price;
  final List<String> images;

  ProductDto(
      {required this.id,
      required this.title,
      required this.category,
      required this.price,
      required this.images})
      : super(id: id, title: title, price: price, category: category, images: images);

  factory ProductDto.fromJson(Map<String, dynamic> json) =>
      _$ProductDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDtoToJson(this);
}
