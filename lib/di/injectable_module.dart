import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:http/http.dart'as http;
@module
abstract class InjectableModule{
  @lazySingleton
  InternetConnectionChecker get internetConnectionChecker=>InternetConnectionChecker();
  @lazySingleton
  http.Client get client{
    http.Client client = http.Client();

    return client;
  }
}