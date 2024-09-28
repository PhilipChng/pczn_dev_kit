// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// Project imports:
import 'package:pczn_dev_kit/pczn_dev_kit.dart';
import 'internet_connection_checker_bloc_test.mocks.dart';

@GenerateNiceMocks([MockSpec<InternetConnection>()])
void main() {
  late InternetConnection checker;
  late InternetConnectionCheckerBloc bloc;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();

    checker = MockInternetConnection();
    bloc = InternetConnectionCheckerBloc(connectionChecker: checker);
  });

  group('InternetConnectionCheckerBloc', () {
    test('uses default InternetConnectionChecker when none is provided', () {
      expect(InternetConnectionCheckerBloc().state, isNull);
    });

    group('state', () {
      test('initial is null', () {
        expect(bloc.state, isNull);
      });

      test('update to true', () {
        bloc.update(InternetStatus.connected);
        expect(bloc.state, isTrue);
      });

      test('update to false', () {
        bloc.update(InternetStatus.disconnected);
        expect(bloc.state, isFalse);
      });
    });

    group('hasConnection', () {
      test('returns true', () async {
        when(checker.hasInternetAccess).thenAnswer((_) async => true);
        final res = await bloc.hasInternetAccess();
        expect(res, isTrue);
        expect(bloc.state, isTrue);
      });

      test('returns false', () async {
        when(checker.hasInternetAccess).thenAnswer((_) async => false);
        final res = await bloc.hasInternetAccess();
        expect(res, isFalse);
        expect(bloc.state, isFalse);
      });
    });
  });
}
