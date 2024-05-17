class ServerException implements Exception {
  final String message;
  ServerException([this.message = "A problem has occurred"]);
}
