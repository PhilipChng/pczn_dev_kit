// ignore_for_file: omit_local_variable_types

// Package imports:
import 'package:test/test.dart';

// Project imports:
import 'package:pczn_dev_kit/pczn_dev_kit.dart';

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

  group('RecaseExtension', () {
    const String mockText = 'This is-Some_sampleText. YouDig?';

    test('camelCase', () {
      expect(
        mockText.camelCase,
        equals('thisIsSomeSampleTextYouDig?'),
      );
    });

    test('CONSTANT_CASE', () {
      expect(
        mockText.constantCase,
        equals('THIS_IS_SOME_SAMPLE_TEXT_YOU_DIG?'),
      );
    });

    test('Sentence case', () {
      expect(
        mockText.sentenceCase,
        equals('This is some sample text you dig?'),
      );
    });

    test('snake_case', () {
      expect(
        mockText.snakeCase,
        equals('this_is_some_sample_text_you_dig?'),
      );
    });

    test('dot.case', () {
      expect(
        mockText.dotCase,
        equals('this.is.some.sample.text.you.dig?'),
      );
    });

    test('path/case', () {
      expect(
        mockText.pathCase,
        equals('this/is/some/sample/text/you/dig?'),
      );
    });

    test('param-case', () {
      expect(
        mockText.paramCase,
        equals('this-is-some-sample-text-you-dig?'),
      );
    });

    test('PascalCase', () {
      expect(
        mockText.pascalCase,
        equals('ThisIsSomeSampleTextYouDig?'),
      );
    });

    test('Header-Case', () {
      expect(
        mockText.headerCase,
        equals('This-Is-Some-Sample-Text-You-Dig?'),
      );
    });

    test('Title-Case', () {
      expect(
        mockText.titleCase,
        equals('This Is Some Sample Text You Dig?'),
      );
    });
  });
}
