part of 'product_bloc.dart';

@immutable
abstract class ProductEvent {}

class ProductFetched extends ProductEvent{}

class FetchProductByCategory extends ProductEvent{
  final int categoryId;

  FetchProductByCategory({required this.categoryId});
}
