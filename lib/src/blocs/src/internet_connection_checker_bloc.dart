// Package imports:
import 'package:bloc/bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

/// {@template internet_connection_checker_bloc}
/// A `Cubit` that handles the internet connection of the application.
///
/// This `Cubit` is responsible for managing the internet connection of the application.
/// It allows the application to check if there is an internet connection.
/// {@endtemplate}
class InternetConnectionCheckerBloc extends Cubit<bool> {
  /// {@macro internet_connection_checker_bloc}
  InternetConnectionCheckerBloc({
    InternetConnectionChecker? connectionChecker,
  })  : _connectionChecker = connectionChecker ?? InternetConnectionChecker(),
        super(false) {
    _connectionChecker.onStatusChange.listen(update);
  }

  final InternetConnectionChecker _connectionChecker;

  /// Updates the state based on the internet connection status.
  void update(InternetConnectionStatus status) {
    switch (status) {
      case InternetConnectionStatus.connected:
        emit(true);
      case InternetConnectionStatus.disconnected:
        emit(false);
    }
  }

  /// Checks if there is an internet connection.
  Future<bool> hasConnection() async {
    final result = await _connectionChecker.hasConnection;

    emit(result);

    return result;
  }
}
