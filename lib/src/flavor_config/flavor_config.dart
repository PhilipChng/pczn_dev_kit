/// The environment that the app is currently running in.
///
/// This enum is used to differentiate between different stages
/// of app deployment, such as development, staging, and production.
/// Each environment can be configured with its own settings
/// and parameters to ensure the app behaves appropriately.
enum Environment {
  /// Development environment - typically used for testing and development purposes.
  development,

  /// Staging environment - used for pre-production testing.
  staging,

  /// Production environment - the live environment that end-users interact with.
  production,
}

/// {@template pczn_dev_kit}
/// A comprehensive Dart package offering a versatile toolbox of utilities, helpers, and extensions to streamline development workflows.
/// {@endtemplate}
class FlavorConfig {
  /// {@macro pczn_dev_kit}
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
