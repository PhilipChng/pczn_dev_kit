// Flutter imports:
import 'package:flutter/material.dart' show ThemeMode;

// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// Project imports:
import 'package:pczn_dev_kit/pczn_dev_kit.dart';
import 'theme_mode_bloc_test.mocks.dart';

@GenerateNiceMocks([MockSpec<Storage>()])
void main() {
  late ThemeModeBloc themeModeBloc;
  late Storage storage;

  setUp(() {
    storage = MockStorage();
    when(storage.read('themeMode')).thenReturn('en');
    when(storage.write('themeMode', any)).thenAnswer((_) async {});

    HydratedBloc.storage = storage;
    themeModeBloc = ThemeModeBloc();
  });

  group('ThemeModeBloc', () {
    test('initial state is ThemeMode.system', () {
      expect(themeModeBloc.state, ThemeMode.system);
    });

    group('change state to emits', () {
      test('ThemeMode.dark', () {
        themeModeBloc.change(ThemeMode.dark);
        expect(themeModeBloc.state, ThemeMode.dark);
      });

      test('ThemeMode.light', () {
        themeModeBloc.change(ThemeMode.light);
        expect(themeModeBloc.state, ThemeMode.light);
      });

      test('ThemeMode.system', () {
        themeModeBloc.change(ThemeMode.system);
        expect(themeModeBloc.state, ThemeMode.system);
      });
    });

    group('toJson called with correct themeMode', () {
      test('for ThemeMode.dark', () {
        themeModeBloc.emit(ThemeMode.dark);
        expect(
          themeModeBloc.toJson(themeModeBloc.state),
          {'themeMode': 'dark'},
        );
      });

      test('for ThemeMode.light', () {
        themeModeBloc.emit(ThemeMode.light);
        expect(
          themeModeBloc.toJson(themeModeBloc.state),
          {'themeMode': 'light'},
        );
      });

      test('for ThemeMode.system', () {
        themeModeBloc.emit(ThemeMode.system);
        expect(
          themeModeBloc.toJson(themeModeBloc.state),
          {'themeMode': 'system'},
        );
      });
    });

    group('fromJson returns correct themeMode', () {
      test('for ThemeMode.dark', () {
        final json = {'themeMode': 'dark'};
        expect(themeModeBloc.fromJson(json), ThemeMode.dark);
      });

      test('for ThemeMode.light', () {
        final json = {'themeMode': 'light'};
        expect(themeModeBloc.fromJson(json), ThemeMode.light);
      });

      test('for ThemeMode.system', () {
        final json = {'themeMode': 'system'};
        expect(themeModeBloc.fromJson(json), ThemeMode.system);
      });
    });
  });
}
