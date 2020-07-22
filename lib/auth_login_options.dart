import 'package:json_annotation/json_annotation.dart';

import 'cmcc_theme_config.dart';
import 'cucc_theme_config.dart';
import 'ctcc_theme_config.dart';

part 'auth_login_options.g.dart';

///移动认证参数
@JsonSerializable(nullable: false)
class AuthLoginOptions{
  ///appid
  String appid;
  ///appkey
  String appkey;

  ///CMCCThemeConfig
  CMCCThemeConfig cmccThemeConfig;
  ///CUCCThemeConfig
  CUCCThemeConfig cuccThemeConfig;
  ///CTCCThemeConfig
  CTCCThemeConfig ctccThemeConfig;

  AuthLoginOptions(
      String appid,
      String appkey,
      {
        CMCCThemeConfig cmccThemeConfig,
        CUCCThemeConfig cuccThemeConfig,
        CTCCThemeConfig ctccThemeConfig,
      }){
    this.appid = appid;
    this.appkey = appkey;
    this.cmccThemeConfig = cmccThemeConfig;
    this.cuccThemeConfig = cuccThemeConfig;
    this.ctccThemeConfig = ctccThemeConfig;
  }

  factory AuthLoginOptions.fromJson(Map<String, dynamic> json) => _$AuthLoginOptionsFromJson(json);

  Map<String, dynamic> toJson() => _$AuthLoginOptionsToJson(this);
}