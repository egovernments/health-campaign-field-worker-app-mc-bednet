import '../utils/environment_config.dart';

/// Single switch for the entire face-auth stack.
///
/// Driven by `FACE_AUTH_ENABLED` in the active `.env` file.
/// Set to `false` to fully disable face-gate, re-verification, face-session
/// home widgets, and non-mobile face flows.
class FaceAuthFeatureFlag {
  static bool get enabled {
    try {
      return envConfig.variables.isFaceAuthEnabled;
    } catch (_) {
      return false;
    }
  }

  const FaceAuthFeatureFlag._();
}
