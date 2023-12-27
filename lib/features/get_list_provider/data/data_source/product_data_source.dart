import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:provider_example/core/constants/server_constant.dart';
import 'package:provider_example/core/utils/failures/failure.dart';

import '../model/product_model.dart';

abstract class ProductDataSource {
  Future<List<ProductModel>> getProductDataSource();
}

@LazySingleton(as: ProductDataSource)
class ProductDataSourceImpL implements ProductDataSource {
  final http.Client client;

  ProductDataSourceImpL({required this.client});

  @override
  Future<List<ProductModel>> getProductDataSource() => _getProductFromUrl(
      'https://android-kotlin-fun-mars-server.appspot.com/realestate');

  Future<List<ProductModel>> _getProductFromUrl(String url) async {
    final response = await client
        .get(Uri.parse(url), headers: {'Content-Type': 'Application/json'});
    if (response.statusCode == 200) {
      print("mmmmmmm");
      final List body = json.decode(response.body);
      print(body);
      return body.map((e) => ProductModel.fromJson(e)).toList();
    } else {
      print(response.statusCode);

      throw ServerFailure(
          errorCode: getErrorBasedOnStatusCode(response.statusCode));
    }
  }
}
