library is_app_upgraded;

import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IsAppUpgraded {
  static const _previousVersionKey = 'previous_version_key';
  static String? _previousVersion;

  static Future<String> AppPreviousVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String currentVersion = packageInfo.version;
    try {
      if (_previousVersion == null) {
        _previousVersion = prefs.getString(_previousVersionKey) ?? currentVersion;
      }
    } on Exception {
      _previousVersion = currentVersion;
    }
    await prefs.setString(_previousVersionKey, currentVersion);
    return _previousVersion!;
  }

  static Future<bool> isPreviousVersionDifferent() async{
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String currentVersion = packageInfo.version;
    String previousVersion = await AppPreviousVersion();
    return (currentVersion != previousVersion);
  }

  static Future<bool> isAppUpgraded() async {
    bool isappupgraded = await isPreviousVersionDifferent();
    return  isappupgraded;
  }
}
