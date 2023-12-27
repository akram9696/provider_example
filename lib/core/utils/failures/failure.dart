import 'package:equatable/equatable.dart';

import '../../constants/server_constant.dart';


abstract class Failure {}

class ServerFailure extends Equatable implements Failure {
  final ServerErrorCode errorCode;
  final String message;
  final ResponseCode? responseCode;

  const ServerFailure({
     required this.errorCode,
    this.message = '',
    this.responseCode,
  });

  @override
  List<Object> get props => [errorCode, message, responseCode!];
}

class CacheFailure implements Failure {}

class LogicFailure implements Failure {
  final String message;

  LogicFailure(this.message);
}

class AppAccessDeniedFailure implements Failure {}
