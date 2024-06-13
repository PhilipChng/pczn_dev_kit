// Package imports:
import 'package:random_string/random_string.dart';

/// A custom generator.
class Generator {
  /// Generates an ID based on the current timestamp.
  static String id() {
    final now = DateTime.now();
    final year = now.year.toString().padLeft(2, '0');
    final month = now.month.toString().padLeft(2, '0');
    final day = now.day.toString().padLeft(2, '0');
    final hour = now.hour.toString().padLeft(2, '0');
    final minute = now.minute.toString().padLeft(2, '0');
    final second = now.second.toString().padLeft(2, '0');
    final alpha = randomAlpha(7);

    return '$year$month${day}_$hour$minute${second}_$alpha';
  }
}
