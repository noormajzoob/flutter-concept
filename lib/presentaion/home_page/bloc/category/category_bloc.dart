import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:storee/domain/models/category.dart';
import 'package:storee/domain/repository/category_repository.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {

  final CategoryRepository _repository;

  CategoryBloc(this._repository) : super(const CategoryState()) {
    on<CategoryEvent>(_fetchCategory);
  }

  void _fetchCategory(CategoryEvent event, Emitter<CategoryState> emitter) async{
    emit(state.copyWith(
      status: CategoryStatus.loading,
      error: null,
    ));
    final resource = await _repository.getAllCategories(limit: 50);

    if(resource.isSuccess){
      emit(state.copyWith(
        status: CategoryStatus.success,
        categories: resource.data
      ));
    }else{
      emit(state.copyWith(
          status: CategoryStatus.failure,
          error: resource.error
      ));
    }

  }
}
