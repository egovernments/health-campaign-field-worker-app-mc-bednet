import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

import '../data/local_store/secure_store/secure_store.dart';

/// Resolves a stable per-device identifier used for single-active-user login
/// enforcement and logout tracking on the backend.
class DeviceIdService {
  static Future<String> getDeviceId() async {
    final cached = await LocalSecureStore.instance.deviceId;
    if (cached != null && cached.isNotEmpty) return cached;

    final id = await _resolveDeviceId();
    await LocalSecureStore.instance.setDeviceId(id);
    return id;
  }

  static Future<String> _resolveDeviceId() async {
    final deviceInfo = DeviceInfoPlugin();
    try {
      if (Platform.isAndroid) {
        final info = await deviceInfo.androidInfo;
        return info.id;
      } else if (Platform.isIOS) {
        final info = await deviceInfo.iosInfo;
        return info.identifierForVendor ?? _fallbackId();
      }
      return _fallbackId();
    } catch (_) {
      return _fallbackId();
    }
  }

  static String _fallbackId() =>
      'unknown-${DateTime.now().millisecondsSinceEpoch}';
}
