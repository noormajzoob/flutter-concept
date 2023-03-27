import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:storee/data/dtos/category_dto.dart';

part 'category_service.g.dart';

@RestApi(baseUrl: 'https://api.escuelajs.co/api/v1/')
abstract class CategoryService {
  factory CategoryService.create(Dio dio, {String? baseUrl}) =>
      _CategoryService(dio, baseUrl: baseUrl);

  @GET('/categories')
  Future<List<CategoryDto>> getAllCategories();
}