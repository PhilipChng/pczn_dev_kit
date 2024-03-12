// ignore_for_file: prefer_const_constructors
import 'package:dart_toolbox/dart_toolbox.dart';
import 'package:test/test.dart';

void main() {
  tearDownAll(FlavorConfig.reset);

  group('FlavorConfig (Dev)', () {
    setUp(() => FlavorConfig(Environment.development));
    tearDown(FlavorConfig.reset);

    _testSingletonBehavior();
    _testEnvironment(Environment.development);
  });

  group('FlavorConfig (Stg)', () {
    setUp(() => FlavorConfig(Environment.staging));
    tearDown(FlavorConfig.reset);

    _testSingletonBehavior();
    _testEnvironment(Environment.staging);
  });

  group('FlavorConfig (Prod)', () {
    setUp(() => FlavorConfig(Environment.production));
    tearDown(FlavorConfig.reset);

    _testSingletonBehavior();
    _testEnvironment(Environment.production);
  });

  group('FlavorConfig instance getter', () {
    test('returns null when no instance is set', () {
      FlavorConfig.reset();
      expect(FlavorConfig.instance, isNull);
    });

    test('returns the current instance of FlavorConfig', () {
      FlavorConfig.reset();
      final config = FlavorConfig(Environment.development);
      expect(FlavorConfig.instance, equals(config));
    });
  });
}

void _testSingletonBehavior() {
  test('return the same instance', () {
    final config1 = FlavorConfig(Environment.development);
    final config2 = FlavorConfig(Environment.production);

    expect(identical(config1, config2), isTrue);
  });
}

void _testEnvironment(Environment expectedEnv) {
  test('return the set environment', () {
    final config = FlavorConfig(Environment.production);

    expect(config.environment, expectedEnv);
  });

  test('report environment status', () {
    expect(FlavorConfig.isDev, expectedEnv == Environment.development);
    expect(FlavorConfig.isStg, expectedEnv == Environment.staging);
    expect(FlavorConfig.isProd, expectedEnv == Environment.production);
  });
}
