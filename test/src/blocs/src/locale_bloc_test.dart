// Flutter imports:
import 'package:flutter/material.dart' show Locale;

// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// Project imports:
import 'package:pczn_dev_kit/pczn_dev_kit.dart';
import 'locale_bloc_test.mocks.dart';

@GenerateNiceMocks([MockSpec<Storage>()])
void main() {
  late LocaleBloc localeBloc;
  late Storage storage;

  setUp(() {
    storage = MockStorage();
    when(storage.read('locale')).thenReturn('en');
    when(storage.write('locale', any)).thenAnswer((_) async {});

    HydratedBloc.storage = storage;
    localeBloc = LocaleBloc();
  });

  group('LocaleBloc', () {
    test('initial state is Locale("en")', () {
      expect(localeBloc.state, const Locale('en'));
    });

    test('change state emits new locale', () {
      localeBloc.change(const Locale('es'));
      expect(localeBloc.state, const Locale('es'));
    });

    test('toJson called with correct locale', () {
      localeBloc.emit(const Locale('es'));
      expect(localeBloc.toJson(localeBloc.state), {'locale': 'es'});
    });

    test('fromJson returns correct locale', () {
      final json = {'locale': 'es'};
      expect(localeBloc.fromJson(json), const Locale('es'));
    });
  });
}
