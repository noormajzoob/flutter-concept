import 'dart:io';

import 'package:storee/data/data_sources/remote/services/product_service.dart';
import 'package:storee/domain/models/product.dart';
import 'package:storee/domain/repository/products_repository.dart';
import 'package:storee/util/resource.dart';

class ProductRepositoryImpl extends ProductRepository{

  final ProductService _service;

  ProductRepositoryImpl(this._service);

  @override
  Future<Resource<List<Product>>> getAllProducts({int offset = 0, int limit = 10}) async{
    try{
      final productsList = await _service.getAllProducts(offset, limit);

      return Future.value(Resource.success(data: productsList));
    }on SocketException{
      return Future.value(Resource.failure(error: "Server error"));
    }on HttpException{
      return Future.value(Resource.failure(error: "Http error"));
    }catch(e){
      return Future.value(Resource.failure(error: e.toString()));
    }
  }

  @override
  Future<Resource<Product>> getProduct({required int id}) async{
    try{
      final product = await _service.getProduct(id);

      return Future.value(Resource.success(data: product));
    }on SocketException{
      return Future.value(Resource.failure(error: "Server error"));
    }on HttpException{
      return Future.value(Resource.failure(error: "Http error"));
    }catch(e){
      return Future.value(Resource.failure(error: e.toString()));
    }
  }

  @override
  Future<Resource<List<Product>>> getCategoryProducts({required int categoryId}) async{
    try{
      final productsList = await _service.getCategoryProducts(categoryId);

      return Future.value(Resource.success(data: productsList));
    }on SocketException{
      return Future.value(Resource.failure(error: "Server error"));
    }on HttpException{
      return Future.value(Resource.failure(error: "Http error"));
    }catch(e){
      return Future.value(Resource.failure(error: e.toString()));
    }
  }

}