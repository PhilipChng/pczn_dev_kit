import 'package:pczn_dev_kit/pczn_dev_kit.dart';
import 'package:test/test.dart';

void main() {
  group('DateTimeExtension', () {
    group('ddMMyyyy', () {
      test('with null', () {
        expect(null.ddMMyyyy, '');
      });

      test('with Actual Date Time', () {
        final now = DateTime.now();
        final day = now.day.toString().padLeft(2, '0');
        final month = now.month.toString().padLeft(2, '0');
        final year = now.year.toString().padLeft(4, '0');
        expect(now.ddMMyyyy, isNotEmpty);
        expect(now.ddMMyyyy, '$day/$month/$year');
      });
    });
  });
}
