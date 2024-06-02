/// Extension methods for nullable boolean
extension BooleanExtensions on bool? {
  /// Returns true if the boolean is TRUE
  bool get isTrue {
    if (this != null && this!) return true;
    return false;
  }

  /// Returns true if the boolean is FALSE
  bool get isFalse {
    if (this != null && !this!) return true;
    return false;
  }
}
