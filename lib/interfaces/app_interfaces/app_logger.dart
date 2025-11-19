abstract interface class AppLogger {
  late final logger;
  errorLog(String errorMessage);
  infoLog(String infoMessage);
  warnLog(String warningMessage);
}
