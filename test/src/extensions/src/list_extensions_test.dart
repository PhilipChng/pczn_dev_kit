import 'package:pczn_dev_kit/pczn_dev_kit.dart';
import 'package:test/test.dart';

void main() {
  group('ListNullable', () {
    final emptyList = <String>[];
    final nonEmptyList = <String>['a'];
    const List<String>? nullList = null;

    test('isNullOrEmpty', () {
      expect(nullList.isNullOrEmpty, isTrue);
      expect(emptyList.isNullOrEmpty, isTrue);
      expect(nonEmptyList.isNullOrEmpty, isFalse);
    });

    test('isNotNullOrEmpty', () {
      expect(nullList.isNotNullOrEmpty, isFalse);
      expect(emptyList.isNotNullOrEmpty, isFalse);
      expect(nonEmptyList.isNotNullOrEmpty, isTrue);
    });
  });

  group('ListIntExt', () {
    test('toStringWithComma', () {
      final emptyList = <int>[];
      final nonEmptyList = <int>[1, 2, 3];
      const List<int>? nullList = null;
      expect(nullList.toStringWithComma, '');
      expect(emptyList.toStringWithComma, '');
      expect(nonEmptyList.toStringWithComma, '1, 2, 3');
    });
  });
}
