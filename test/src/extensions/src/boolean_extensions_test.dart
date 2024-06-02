import 'package:dart_toolbox/dart_toolbox.dart';
import 'package:test/test.dart';

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
