class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  @override
  String toString() {
    return '$_message \n $_prefix';
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message]) : super(message, "No Data Found");
}

class NoInternetException extends AppException {
  NoInternetException([String? message])
      : super(message, "No Internet Conncetion");
}

class BadRequestException extends AppException {
  BadRequestException([String? message])
      : super(message, "Invalid URL Request");
}

class UnAutorizedAccessException extends AppException {
  UnAutorizedAccessException([String? message])
      : super(message, "UnAutorize User");
}

class InternalServerException extends AppException {
  InternalServerException([String? message])
      : super(message, "Internal Server Problem");
}

class BadGateWayException extends AppException {
  BadGateWayException([String? message])
      : super(message, "BadGateWay Exception");
}

class NoServiceException extends AppException {
  NoServiceException([String? message]) : super(message, "Service Unavailable");
}

class GatewayTimeOutException extends AppException {
  GatewayTimeOutException([String? message])
      : super(message, "Gateway Timeout");
}
