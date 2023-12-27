import 'package:dartz/dartz.dart';

import '../../../../core/utils/failures/failure.dart';
import '../entities/product.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> getProductList();
}
