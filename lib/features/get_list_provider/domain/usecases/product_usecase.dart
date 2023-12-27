import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/failures/failure.dart';
import '../entities/product.dart';
import '../repositories/product_repository.dart';

@lazySingleton
class GetProductUseCase extends UseCase<List<Product>, NoParams> {
  final ProductRepository repo;

  GetProductUseCase({required this.repo});

  @override
  Future<Either<Failure, List<Product>>> call(params) async {
    return await repo.getProductList();
  }


}
// class NoParams extends Equatable {
//   @override
//
//   List<Object?> get props => [];
// }