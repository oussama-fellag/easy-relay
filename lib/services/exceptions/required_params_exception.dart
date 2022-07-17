class RequiredParamsException implements Exception {
  final dynamic exceptionMessage;
  RequiredParamsException(
      [this.exceptionMessage = "one of the required parameters is not set"]);
  @override
  String toString() {
    // TODO: implement toString
    return exceptionMessage;
  }
}
