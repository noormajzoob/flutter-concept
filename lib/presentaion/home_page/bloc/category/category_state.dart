part of 'category_bloc.dart';

enum CategoryStatus { loading, success, failure }

class CategoryState {
  const CategoryState({
    this.status = CategoryStatus.loading,
    this.categories = const <Category>[],
    this.error
  });

  final CategoryStatus status;
  final List<Category> categories;
  final String? error;

  CategoryState copyWith({
    CategoryStatus? status,
    List<Category>? categories,
    String? error,
  }) {
    return CategoryState(
      status: status ?? this.status,
      categories: categories ?? this.categories,
      error: error?? this.error,
    );
  }
}
