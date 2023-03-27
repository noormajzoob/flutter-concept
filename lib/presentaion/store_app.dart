import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:storee/data/data_sources/remote/services/category_service.dart';
import 'package:storee/data/data_sources/remote/services/product_service.dart';
import 'package:storee/data/repository/category_repository_impl.dart';
import 'package:storee/data/repository/product_repository_impl.dart';
import 'package:storee/presentaion/home_page/bloc/category/category_bloc.dart';
import 'package:storee/presentaion/home_page/bloc/products/product_bloc.dart';
import 'package:storee/presentaion/home_page/home_page.dart';
import 'package:storee/presentaion/theme/color_schemes.g.dart';

class StoreApp extends StatelessWidget{

  const StoreApp({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CategoryBloc>(
          create: (context)=> CategoryBloc(
              CategoryRepositoryImpl(
                  CategoryService.create(
                      Dio()..interceptors.add(PrettyDioLogger())
                  )
              )
          )..add(CategoryFetched()),
        ),
        BlocProvider<ProductBloc>(
          create: (context)=> ProductBloc(
              ProductRepositoryImpl(
                  ProductService.create(
                    Dio()..interceptors.add(PrettyDioLogger())
                  )
              )
          )..add(ProductFetched()),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
        darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
      ),
    );
  }
}
