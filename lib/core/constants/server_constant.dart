enum ServerErrorCode {
  serverError,
  unauthenticated,
  noInternetConnection,
  invalidData,
  notFound,
  wrongInput,
  customError,
  appVersionExpired,
  unauthourized
}

enum ResponseCode {
  inactiveAccount, // when code =1009
  accountIsNotAssignWithSchool, // when code =1010
  blockedAccount, // when code =1011
}

ServerErrorCode getErrorBasedOnStatusCode(int? statusCode) {
  ServerErrorCode errorCode = ServerErrorCode.serverError;

  if (statusCode == 500) {
    errorCode = ServerErrorCode.serverError;
  } else if (statusCode == 401) {
    errorCode = ServerErrorCode.unauthenticated; //no token
  } else if (statusCode == 403) {
    errorCode = ServerErrorCode.unauthourized; //without permmison
  } else if (statusCode == 400) {
    errorCode = ServerErrorCode.invalidData; // bad request
  } else if (statusCode == 404) {
    errorCode = ServerErrorCode.notFound; //url not found
  }

  return errorCode;
}
