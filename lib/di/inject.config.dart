// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:http/http.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i4;

import '../core/utils/network/network_info.dart' as _i5;
import '../features/get_list_provider/data/data_source/product_data_source.dart'
    as _i6;
import '../features/get_list_provider/data/repository/product_repository_impl.dart'
    as _i8;
import '../features/get_list_provider/domain/repositories/product_repository.dart'
    as _i7;
import '../features/get_list_provider/domain/usecases/product_usecase.dart'
    as _i9;
import '../features/get_list_provider/presentation/providers/product_change_notifer.dart'
    as _i10;
import 'injectable_module.dart' as _i11; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final injectableModule = _$InjectableModule();
  gh.lazySingleton<_i3.Client>(() => injectableModule.client);
  gh.lazySingleton<_i4.InternetConnectionChecker>(
      () => injectableModule.internetConnectionChecker);
  gh.lazySingleton<_i5.NetworkInfo>(
      () => _i5.NetworkInfoImpl(get<_i4.InternetConnectionChecker>()));
  gh.lazySingleton<_i6.ProductDataSource>(
      () => _i6.ProductDataSourceImpL(client: get<_i3.Client>()));
  gh.lazySingleton<_i7.ProductRepository>(() => _i8.ProductRepositoryImpl(
        get<_i6.ProductDataSource>(),
        get<_i5.NetworkInfo>(),
      ));
  gh.lazySingleton<_i9.GetProductUseCase>(
      () => _i9.GetProductUseCase(repo: get<_i7.ProductRepository>()));
  gh.factory<_i10.ProductChangeNotifier>(() =>
      _i10.ProductChangeNotifier(getAllProducts: get<_i9.GetProductUseCase>()));
  return get;
}

class _$InjectableModule extends _i11.InjectableModule {}
