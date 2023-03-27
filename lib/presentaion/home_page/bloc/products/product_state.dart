part of 'product_bloc.dart';

enum ProductStatus { loading, success, failure }

class ProductState {
  const ProductState({
    this.status = ProductStatus.loading,
    this.products = const <Product>[],
    this.error
  });

  final ProductStatus status;
  final List<Product> products;
  final String? error;

  ProductState copyWith({
    ProductStatus? status,
    List<Product>? products,
    String? error,
  }) {
    return ProductState(
      status: status ?? this.status,
      products: products ?? this.products,
      error: error?? this.error,
    );
  }
}