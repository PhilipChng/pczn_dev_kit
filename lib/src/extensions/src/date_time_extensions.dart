/// {@template list_extensions}
/// Extension methods for DateTime
/// {@endtemplate}
extension DateTimeToString on DateTime {
  /// DD/MM/YYYY
  String get ddMMyyyy {
    final fDay = day.toString().padLeft(2, '0');
    final fMonth = month.toString().padLeft(2, '0');
    final fYear = year.toString().padLeft(4, '0');
    return '$fDay/$fMonth/$fYear';
  }
}
