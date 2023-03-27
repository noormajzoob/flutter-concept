import 'package:storee/domain/models/category.dart';
import 'package:storee/util/resource.dart';

abstract class CategoryRepository {
  Future<Resource<Category>> getCategory({required int id});
  Future<Resource<List<Category>>> getAllCategories({int offset = 0, int limit = 10});
}
