import 'package:flavor_config/src/environment.dart';

/// {@template flavor_config}
/// A Dart package for managing different environments or flavors.
/// {@endtemplate}
class FlavorConfig {
  /// {@macro flavor_config}
  factory FlavorConfig(Environment env) {
    _instance ??= FlavorConfig._internal(env);
    return _instance!;
  }

  FlavorConfig._internal(this.environment);

  /// The current environment setting of the application.
  ///
  /// This property holds an instance of `Environment`, representing the current
  /// operational context, such as development, staging, or production.
  final Environment environment;

  static FlavorConfig? _instance;

  /// Gets the singleton instance of `FlavorConfig`.
  ///
  /// Returns the current instance if it has been initialized, otherwise null.
  /// This ensures a unified configuration environment across the application.
  static FlavorConfig? get instance => _instance;

  /// Checks if the current environment is development.
  ///
  /// Returns `true` if the `environment` property is set to `Environment.development`.
  /// Useful for enabling features specific to the development phase.
  static bool get isDev => _instance?.environment == Environment.development;

  /// Checks if the current environment is staging.
  ///
  /// Returns `true` if the `environment` property is set to `Environment.staging`.
  /// This is typically used for staging-specific configurations.
  static bool get isStg => _instance?.environment == Environment.staging;

  /// Checks if the current environment is production.
  ///
  /// Returns `true` if the `environment` property is set to `Environment.production`.
  /// Essential for enabling or disabling production-specific features.
  static bool get isProd => _instance?.environment == Environment.production;

  /// Resets the singleton instance of `FlavorConfig`.
  ///
  /// This method is primarily used for testing purposes to reset the state of the singleton.
  static void reset() => _instance = null;
}
