import 'package:dart_toolbox/dart_toolbox.dart';
import 'package:test/test.dart';

void main() {
  group('DateTimeExtension', () {
    test('ddMMyyyy', () {
      final now = DateTime.now();
      final day = now.day.toString().padLeft(2, '0');
      final month = now.month.toString().padLeft(2, '0');
      final year = now.year.toString().padLeft(4, '0');
      expect(now.ddMMyyyy, isNotEmpty);
      expect(now.ddMMyyyy, '$day/$month/$year');
    });
  });
}
