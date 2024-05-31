import 'package:recase/recase.dart';

/// Extension methods for String
extension StringExtension on String? {
  /// Returns true if the string is null or empty
  bool get isNullOrEmpty {
    if (this == null) {
      return true;
    } else {
      if (this!.isEmpty) return true;
      return false;
    }
  }

  /// Returns true if the string is not null or not empty
  bool get isNotNullOrEmpty => !isNullOrEmpty;

  /// Returns true if the string is a valid email
  bool get isEmail {
    if (this == null) return false;

    return RegExp(
      r"^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$",
    ).hasMatch(this!.toLowerCase());
  }
}

/// Extension to recase for String
extension RecaseExtension on String {
  /// camelCase
  String get camelCase => ReCase(this).camelCase;

  /// CONSTANT_CASE
  String get constantCase => ReCase(this).constantCase;

  /// Sentence case
  String get sentenceCase => ReCase(this).sentenceCase;

  /// snake_case
  String get snakeCase => ReCase(this).snakeCase;

  /// dot.case
  String get dotCase => ReCase(this).dotCase;

  /// param-case
  String get paramCase => ReCase(this).paramCase;

  /// path/case
  String get pathCase => ReCase(this).pathCase;

  /// PascalCase
  String get pascalCase => ReCase(this).pascalCase;

  /// Header-Case
  String get headerCase => ReCase(this).headerCase;

  /// Title-Case
  String get titleCase => ReCase(this).titleCase;
}
