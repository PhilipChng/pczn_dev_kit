// Flutter imports:
import 'package:flutter/material.dart' show ThemeMode;

// Package imports:
import 'package:hydrated_bloc/hydrated_bloc.dart';

/// {@template theme_mode_bloc}
/// A `Cubit` that handles the theme mode of the application.
///
/// This `Cubit` is responsible for managing the theme mode of the application.
/// It allows the application to switch between different themes: system, light, and dark.
/// The theme mode is persisted and can be restored using the `HydratedCubit` class.
///
/// The `ThemeModeBloc` emits the current theme mode and allows clients to change the theme mode by calling the `change` method.
/// {@endtemplate}
class ThemeModeBloc extends HydratedCubit<ThemeMode> {
  /// {@macro theme_mode_bloc}
  ThemeModeBloc() : super(ThemeMode.system);

  /// Changes the current theme mode.
  void change(ThemeMode? value) => emit(value ?? state);

  @override
  ThemeMode? fromJson(Map<String, dynamic> json) {
    switch (json['themeMode']) {
      case 'dark':
        return ThemeMode.dark;
      case 'light':
        return ThemeMode.light;
      default:
        return ThemeMode.system;
    }
  }

  @override
  Map<String, dynamic>? toJson(ThemeMode state) {
    return {'themeMode': state.name};
  }
}
