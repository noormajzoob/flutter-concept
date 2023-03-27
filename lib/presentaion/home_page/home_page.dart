import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_constraintlayout/flutter_constraintlayout.dart';
import 'package:storee/presentaion/details_page/details_page.dart';
import 'package:storee/presentaion/home_page/bloc/category/category_bloc.dart';
import 'package:storee/presentaion/home_page/bloc/products/product_bloc.dart';
import 'package:storee/presentaion/home_page/widget/category_widget.dart';
import 'package:storee/presentaion/home_page/widget/product_list_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final h = ConstraintId('as');
    final h1 = ConstraintId('asa');

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: const Text('Store'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: Flex(
        direction: Axis.vertical,
        children: [
          Flexible(flex: 1, child: header(context)),
          Flexible(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: BlocBuilder<ProductBloc, ProductState>(
                builder: (context, state) {
                  switch (state.status) {
                    case ProductStatus.loading:
                    case ProductStatus.success:
                      if(state.status == ProductStatus.success && state.products.isEmpty){
                        return  const Center(
                          child: Text('There is no products.'),
                        );
                      }
                      return ProductListWidget(
                        products: state.products,
                        isLoading: state.status == ProductStatus.loading,
                        onItemClick: (product) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context){
                                return DetailsPage(
                                  product: product,
                                );
                              }
                            )
                          );
                        },
                      );
                    case ProductStatus.failure:
                      return Center(
                        child: Text(state.error ?? ''),
                      );
                  }
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget header(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Categories',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
          ),
        ),
        BlocBuilder<CategoryBloc, CategoryState>(builder: (context, state) {
          switch (state.status) {
            case CategoryStatus.loading:
              return Expanded(
                  child: CategoryView(
                      isLoading: true, data: [], onSelect: (onSelect) {}));
            case CategoryStatus.success:
              return Expanded(
                  child: CategoryView(
                      isLoading: false,
                      data: state.categories,
                      onSelect: (category) {
                        context.read<ProductBloc>().add(
                            FetchProductByCategory(categoryId: category.id));
                      }));
            case CategoryStatus.failure:
              return Expanded(
                  child: Row(
                children: [
                  Text(state.error ?? ''),
                  const SizedBox(width: 6),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Refresh'),
                  )
                ],
              ));
          }
        })
      ],
    );
  }
}
