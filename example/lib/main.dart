import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_emay_login/flutter_emay_login.dart';
import 'package:flutter_emay_login/cmcc_theme_config.dart';
import 'package:flutter_emay_login/auth_login_options.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  String _restText = '返回结果：';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await FlutterEmayLogin.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: new Column(
            children: <Widget>[
              RaisedButton(
                  child: Text('loginAuth(授权登录)'),
                  onPressed: () async {
                    Map result = await FlutterEmayLogin.displayLogin(
                        new AuthLoginOptions('300011880083','9DC5CE24E4AAD5603CE62F7D927BBFCC',cmccThemeConfig: new CMCCThemeConfig())
                    );
                    print(result.toString());
                    setState(() {
                      _restText = result.toString();
                    });
                  }),
            ]
        ),
      ),
    );
  }
}
