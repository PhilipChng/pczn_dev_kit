/// {@template list_extensions}
/// Extension methods for List
/// {@endtemplate}
extension ListNullable on List<dynamic>? {
  /// Returns true if the list is null or empty
  bool get isNullOrEmpty {
    if (this == null) return true;
    if (this!.isEmpty) return true;
    return false;
  }

  /// Returns true if the list is not null or not empty
  bool get isNotNullOrEmpty => !isNullOrEmpty;
}

/// {@template list_extensions}
/// Extension methods for List<int>
/// {@endtemplate}
extension ListIntExt on List<int>? {
  /// Returns a string representation of the list
  String get toStringWithComma {
    if (this == null) return '';

    return this!.map((e) => e.toString()).join(', ')
      ..replaceAll('[', '')
      ..replaceAll(']', '');
  }
}
