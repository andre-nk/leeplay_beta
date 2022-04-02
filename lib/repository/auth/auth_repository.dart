import 'package:flutter/services.dart';
import 'package:flutter_line_sdk/flutter_line_sdk.dart';

class AuthRepository {
  final LineSDK _lineSDK;

  AuthRepository({required LineSDK lineSDK}) : _lineSDK = lineSDK;

  Future<UserProfile> currentUser() async {
    final _profile = await _lineSDK.getProfile();
    return _profile;
  }

  Future<UserProfile> loginWithLine() async {
    try {
      final _loginResult = await _lineSDK.login();
      if (_loginResult.userProfile != null) {
        return _loginResult.userProfile!;
      } else {
        throw Exception("Login failed!");
      }
    } on PlatformException catch (e) {
      throw Exception(e.toString());
    }
  }
}
