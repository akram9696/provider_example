import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:provider_example/core/usecases/usecase.dart';
import 'package:provider_example/core/utils/failures/failure.dart';

import '../../domain/entities/product.dart';
import '../../domain/usecases/product_usecase.dart';

@injectable
class ProductChangeNotifier extends ChangeNotifier {
  ProductChangeNotifier({
    required this.getAllProducts,
  });

  final GetProductUseCase getAllProducts;

  List<Product> products = [];

  bool loading = false;
  Failure? failure;

  Future<void> fetchNextPage() async {
    loading = true;
    notifyListeners();
    final result = await getAllProducts(NoParams());

    result.fold((l) {
      failure = l;
      print(l);
    }, (r) {
      products.clear();

      products.addAll(r);
       print("+++${products.length}");
    });
    print("finish request");

    loading = false;
    notifyListeners();
    print(loading);
  }
}
