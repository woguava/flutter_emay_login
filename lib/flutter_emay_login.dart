import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_emay_login/auth_login_options.dart';

class FlutterEmayLogin {
  static const MethodChannel _channel =
      const MethodChannel('flutter_emay_login');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  ///显示一键登录
  static Future<Map>  displayLogin(AuthLoginOptions authLoginOptions) async {
    try{
      print('-----------begin-------------');
      print(authLoginOptions.toJson());
      print('-----------end-------------');
      var res =  await _channel.invokeMethod('displayLogin',authLoginOptions.toJson());
      return res;
    } on PlatformException catch (e) {
      print(e);
      Map resutMap = new Map();
      resutMap['retCode'] = "1004";
      resutMap['retMsg'] = e.toString();
      return resutMap;
    }
  }

}
