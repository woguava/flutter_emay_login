// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_login_options.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthLoginOptions _$AuthLoginOptionsFromJson(Map<String, dynamic> json) {
  return AuthLoginOptions(
    json['appid'] as String,
    json['appkey'] as String,
    cmccThemeConfig: CMCCThemeConfig.fromJson(
        json['cmccThemeConfig'] as Map<String, dynamic>),
    cuccThemeConfig: CUCCThemeConfig.fromJson(
        json['cuccThemeConfig'] as Map<String, dynamic>),
    ctccThemeConfig: CTCCThemeConfig.fromJson(
        json['ctccThemeConfig'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AuthLoginOptionsToJson(AuthLoginOptions instance) =>
    <String, dynamic>{
      'appid': instance.appid,
      'appkey': instance.appkey,
      'cmccThemeConfig': instance.cmccThemeConfig?.toJson(),
      'cuccThemeConfig': instance.cuccThemeConfig?.toJson(),
      'ctccThemeConfig': instance.ctccThemeConfig?.toJson(),
    };
