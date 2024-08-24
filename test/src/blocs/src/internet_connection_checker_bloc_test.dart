// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

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
    test('uses default InternetConnectionChecker when none is provided', () {
      expect(InternetConnectionCheckerBloc().state, isFalse);
    });

    group('state', () {
      test('initial is false', () {
        expect(bloc.state, isFalse);
      });

      test('update to true', () {
        bloc.update(InternetConnectionStatus.connected);
        expect(bloc.state, isTrue);
      });

      test('update to false', () {
        bloc.update(InternetConnectionStatus.disconnected);
        expect(bloc.state, isFalse);
      });
    });

    group('hasConnection', () {
      test('returns true', () async {
        when(checker.hasConnection).thenAnswer((_) async => true);
        final res = await bloc.hasConnection();
        expect(res, isTrue);
        expect(bloc.state, isTrue);
      });

      test('returns false', () async {
        when(checker.hasConnection).thenAnswer((_) async => false);
        final res = await bloc.hasConnection();
        expect(res, isFalse);
        expect(bloc.state, isFalse);
      });
    });
  });
}
