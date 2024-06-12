/// {@template list_extensions}
/// Extension methods for DateTime
/// {@endtemplate}
extension DateTimeToString on DateTime? {
  /// DD/MM/YYYY
  String get ddMMyyyy {
    if (this == null) return '';

    final fDay = this!.day.toString().padLeft(2, '0');
    final fMonth = this!.month.toString().padLeft(2, '0');
    final fYear = this!.year.toString().padLeft(4, '0');
    return '$fDay/$fMonth/$fYear';
  }
}
