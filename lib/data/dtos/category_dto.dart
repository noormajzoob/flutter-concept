import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:storee/domain/models/category.dart' as ct;


part 'category_dto.g.dart';

@JsonSerializable()
class CategoryDto extends ct.Category {
  CategoryDto({required super.id, required super.name, required super.image});

  factory CategoryDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryDtoToJson(this);
}
