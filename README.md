# flutter_emay_login

亿美一键登录 Flutter 插件

## Getting Started

This project is a starting point for a Flutter
[plug-in package](https://flutter.dev/developing-packages/),
a specialized package that includes platform-specific implementation code for
Android and/or iOS.

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.

#Andirid 
##配置混淆策略(proguard-rules.pro)
###ct天翼账号SDK
-keep class com.cmic.sso.sdk.**{*;}
-keep class cn.com.chinatelecom.account.**{*;}
### cmcc中国移动一键免密登录
-dontwarn com.cmic.sso.sdk.**
-keep class com.cmic.sso.sdk.**{*;}
### cu 小沃科技免密登录sdk
-dontwarn com.unicom.xiaowo.login.**
-keep class com.unicom.xiaowo.login.**{*;}
-dontwarn com.sdk.**
-keep class com.sdk.** { *;}
### cmcc
-dontwarn com.cmcc.allnetlogin.**
-keep class com.cmcc.allnetlogin.client.**{*;}
-keep class com.cmcc.allnetlogin.model.**{*;}
-keep class com.cmcc.allnetlogin.http.**{*;}
-keep class com.cmcc.allnetlogin.utils.**{*;}
-keep class org.apache.commons.codec1.**{*;}
### emay
-keep class cn.emay.ql.UniSDK{*;}
-keep class cn.emay.ql.LoginCallback{*;}
-keep class cn.emay.ql.UniLoginActivity{*;}
-keep class cn.emay.ql.utils.**{*;}

## 自定义UI,COPY
activity_oauth.xml  //联通登录页面
ct_account_auth_activity_dynamic.xml    //电信普通登录页面
ct_account_mini_auth_activity_dynamic.xml   //电信弹窗登录页面
三个文件到主项目 layout 目录下

