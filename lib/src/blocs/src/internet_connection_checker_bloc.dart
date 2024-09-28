// Package imports:
import 'package:bloc/bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

/// {@template internet_connection_checker_bloc}
/// A `Cubit` that handles the internet connection of the application.
///
/// This `Cubit` is responsible for managing the internet connection of the application.
/// It allows the application to check if there is an internet connection.
/// {@endtemplate}
class InternetConnectionCheckerBloc extends Cubit<bool?> {
  /// {@macro internet_connection_checker_bloc}
  InternetConnectionCheckerBloc({
    InternetConnection? connectionChecker,
  })  : _connectionChecker = connectionChecker ?? InternetConnection(),
        super(null) {
    _connectionChecker.onStatusChange.listen(update);
  }

  final InternetConnection _connectionChecker;

  /// Updates the state based on the internet connection status.
  void update(InternetStatus status) {
    switch (status) {
      case InternetStatus.connected:
        emit(true);
      case InternetStatus.disconnected:
        emit(false);
    }
  }

  /// Checks if there is an internet connection.
  Future<bool> hasInternetAccess() async {
    final result = await _connectionChecker.hasInternetAccess;

    emit(result);

    return result;
  }
}
