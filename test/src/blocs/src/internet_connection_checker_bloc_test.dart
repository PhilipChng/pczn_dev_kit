// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/annotations.dart';

// Project imports:
import 'package:pczn_dev_kit/pczn_dev_kit.dart';
import 'internet_connection_checker_bloc_test.mocks.dart';

@GenerateNiceMocks([MockSpec<InternetConnectionChecker>()])
void main() {
  late MockInternetConnectionChecker checker;
  late InternetConnectionCheckerBloc bloc;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();

    checker = MockInternetConnectionChecker();
    bloc = InternetConnectionCheckerBloc(connectionChecker: checker);
  });

  group('InternetConnectionCheckerBloc', () {
    test('initial state is false', () {
      expect(bloc.state, false);
    });

    test('update state to true', () {
      bloc.update(InternetConnectionStatus.connected);
      expect(bloc.state, true);
    });

    test('update state to false', () {
      bloc.update(InternetConnectionStatus.disconnected);
      expect(bloc.state, false);
    });

    test('uses default InternetConnectionChecker when none is provided', () {
      final defaultBloc = InternetConnectionCheckerBloc();
      expect(defaultBloc.state, false);
    });
  });
}
