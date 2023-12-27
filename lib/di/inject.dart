import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:provider_example/di/inject.config.dart';



final getIt = GetIt.instance;

@InjectableInit()
void registerDependencies() => $initGetIt(getIt);
