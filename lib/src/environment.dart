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
