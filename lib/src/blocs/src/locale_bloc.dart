// Flutter imports:
import 'package:flutter/material.dart' show Locale;

// Package imports:
import 'package:hydrated_bloc/hydrated_bloc.dart';

/// {@template locale_bloc}
/// A `Cubit` that handles the locale of the application.
///
/// This `Cubit` is responsible for managing the locale of the application.
/// It allows the application to switch between different locales.
/// The locale is persisted and can be restored using the `HydratedCubit` class.
///
/// The `LocaleBloc` emits the current locale and allows clients to change the locale by calling the `change` method.
/// {@endtemplate}
class LocaleBloc extends HydratedCubit<Locale> {
  /// {@macro locale_bloc}
  LocaleBloc() : super(const Locale('en'));

  /// Changes the current locale.
  void change(Locale? value) => emit(value ?? state);

  @override
  Locale? fromJson(Map<String, dynamic> json) {
    final language = json['locale'] as String?;
    return language == null ? null : Locale(language);
  }

  @override
  Map<String, dynamic>? toJson(Locale state) {
    return <String, String>{'locale': state.languageCode};
  }
}
