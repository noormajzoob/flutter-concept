import 'dart:io';

import 'package:storee/data/data_sources/remote/services/category_service.dart';
import 'package:storee/domain/models/category.dart';
import 'package:storee/domain/repository/category_repository.dart';
import 'package:storee/util/resource.dart';

class CategoryRepositoryImpl extends CategoryRepository{

  final CategoryService _service;

  CategoryRepositoryImpl(this._service);


  @override
  Future<Resource<List<Category>>> getAllCategories({int offset = 0, int limit = 10}) async{
    try{
      // final categories = await
      final categories = await _service.getAllCategories();

      return Future.value(Resource.success(data: categories));
    }on SocketException{
      return Future.value(Resource.failure(error: "Server error"));
    }on HttpException{
      return Future.value(Resource.failure(error: "Http error"));
    }catch(e){
      return Future.value(Resource.failure(error: e.toString()));
    }
  }

  @override
  Future<Resource<Category>> getCategory({required int id}) {
    // TODO: implement getCategory
    throw UnimplementedError();
  }

}