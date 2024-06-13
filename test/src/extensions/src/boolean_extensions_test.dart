// Package imports:
import 'package:test/test.dart';

// Project imports:
import 'package:pczn_dev_kit/pczn_dev_kit.dart';

void main() {
  group('BooleanExtensions', () {
    test('isTrue', () {
      expect(null.isTrue, isFalse);
      expect(false.isTrue, isFalse);
      expect(true.isTrue, isTrue);
    });

    test('isFalse', () {
      expect(null.isFalse, isFalse);
      expect(false.isFalse, isTrue);
      expect(true.isFalse, isFalse);
    });
  });
}
