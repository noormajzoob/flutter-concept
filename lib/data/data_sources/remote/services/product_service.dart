import 'package:storee/data/dtos/product_dto.dart';
import 'package:storee/domain/models/product.dart';
import 'package:retrofit/retrofit.dart';

import 'package:dio/dio.dart';

part 'product_service.g.dart';

@RestApi(baseUrl: 'https://api.escuelajs.co/api/v1/')
abstract class ProductService {
  factory ProductService.create(Dio dio, {String? baseUrl}) =>
      _ProductService(dio, baseUrl: baseUrl);

  @GET('/products/{id}')
  Future<ProductDto> getProduct(@Path('id') int id);

  @GET('/products')
  Future<List<ProductDto>> getAllProducts(
    @Query('offset') int offset,
    @Query('limit') int limit,
  );

  @GET('/categories/{id}/products')
  Future<List<ProductDto>> getCategoryProducts(
    @Path('id') int id,
  );
}
