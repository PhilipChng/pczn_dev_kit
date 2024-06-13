// Package imports:
import 'package:test/test.dart';

// Project imports:
import 'package:pczn_dev_kit/src/generator/generator.dart';

void main() {
  group('Generator', () {
    test('id', () {
      final now = DateTime.now();
      final id = Generator.id();
      expect(id, isNotEmpty);
      expect(id, contains(now.year.toString().padLeft(2, '0')));
      expect(id, contains(now.month.toString().padLeft(2, '0')));
      expect(id, contains(now.day.toString().padLeft(2, '0')));
      expect(id, contains(now.hour.toString().padLeft(2, '0')));
      expect(id, contains(now.minute.toString().padLeft(2, '0')));
      expect(id, contains(now.second.toString().padLeft(2, '0')));
    });
  });
}
