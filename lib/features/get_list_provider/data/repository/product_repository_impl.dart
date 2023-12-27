import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:provider_example/core/constants/server_constant.dart';
import 'package:provider_example/core/utils/failures/failure.dart';
import 'package:provider_example/features/get_list_provider/data/data_source/product_data_source.dart';
import 'package:provider_example/features/get_list_provider/domain/entities/product.dart';

import '../../../../core/utils/network/network_info.dart';
import '../../domain/repositories/product_repository.dart';
import '../model/product_model.dart';

@LazySingleton(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository {
  final ProductDataSource remote;
  final NetworkInfo networkInfo;

  ProductRepositoryImpl(
    this.remote,
    this.networkInfo,
  );

  @override
  Future<Either<Failure, List<Product>>> getProductList() async {
    try {
      if (await networkInfo.isConnected) {
        final List<ProductModel> productList = await remote.getProductDataSource();
        final List<Product> products = productList.map((e) => e.toDomain()).toList();
        return (right(products));
      } else {
        return (left(ServerFailure(errorCode: ServerErrorCode.noInternetConnection)));
      }
    } on Failure catch (e) {
      return left(e);
    } catch (e) {
      print(e.toString());

      return left(LogicFailure("logic failure"));
    }
  }
}
