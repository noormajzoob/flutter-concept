import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:storee/domain/models/product.dart';
import 'package:storee/domain/repository/products_repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {

  final ProductRepository _repository;

  ProductBloc(this._repository) : super(const ProductState()) {
    on<ProductFetched>(_fetchProducts);
    on<FetchProductByCategory>(_fetchProductsByCategory);
  }

  void _fetchProducts(ProductFetched event, Emitter<ProductState> emitter) async {
    emit(state.copyWith(
      status: ProductStatus.loading,
      error: null,
    ));
    final resource = await _repository.getAllProducts();

    if (resource.isSuccess) {
      emit(state.copyWith(
          status: ProductStatus.success,
          products: resource.data
      ));
    } else {
      emit(state.copyWith(
          status: ProductStatus.failure,
          error: resource.error
      ));
    }
  }

  void _fetchProductsByCategory(FetchProductByCategory event, Emitter<ProductState> emitter) async{
    emit(state.copyWith(
      status: ProductStatus.loading,
      error: null,
    ));

    final resource = await _repository.getCategoryProducts(categoryId: event.categoryId);

    if (resource.isSuccess) {
      emit(state.copyWith(
          status: ProductStatus.success,
          products: resource.data
      ));
    } else {
      emit(state.copyWith(
          status: ProductStatus.failure,
          error: resource.error
      ));
    }
  }
}
