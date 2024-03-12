// ignore_for_file: omit_local_variable_types

import 'package:dart_toolbox/dart_toolbox.dart';
import 'package:test/test.dart';

void main() {
  group('StringExtension', () {
    const String? nullString = null;
    const String emptyString = '';
    const String testString = 'test';
    const String testIntString = '123';
    const String numericString = '12345';
    const String emailString = '5JUeh@example.com';

    test('isNullOrEmpty', () {
      expect(nullString.isNullOrEmpty, isTrue);
      expect(emptyString.isNullOrEmpty, isTrue);
      expect(testString.isNullOrEmpty, isFalse);
      expect(testIntString.isNullOrEmpty, isFalse);
      expect(numericString.isNullOrEmpty, isFalse);
      expect(emailString.isNullOrEmpty, isFalse);
    });

    test('isNotNullOrEmpty', () {
      expect(nullString.isNotNullOrEmpty, isFalse);
      expect(emptyString.isNotNullOrEmpty, isFalse);
      expect(testString.isNotNullOrEmpty, isTrue);
      expect(testIntString.isNotNullOrEmpty, isTrue);
      expect(numericString.isNotNullOrEmpty, isTrue);
      expect(emailString.isNotNullOrEmpty, isTrue);
    });

    test('isEmail', () {
      expect(nullString.isEmail, isFalse);
      expect(emptyString.isEmail, isFalse);
      expect(testString.isEmail, isFalse);
      expect(testIntString.isEmail, isFalse);
      expect(numericString.isEmail, isFalse);
      expect(emailString.isEmail, isTrue);
    });
  });
}
