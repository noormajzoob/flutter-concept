import 'package:storee/util/resource.dart';

import '../models/product.dart';

abstract class ProductRepository {
  Future<Resource<Product>> getProduct({required int id});
  Future<Resource<List<Product>>> getAllProducts({int offset = 0, int limit = 10});
  Future<Resource<List<Product>>> getCategoryProducts({required int categoryId});
}
