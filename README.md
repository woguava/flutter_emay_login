# flutter_emay_login

����һ����¼ Flutter ���

## Getting Started

This project is a starting point for a Flutter
[plug-in package](https://flutter.dev/developing-packages/),
a specialized package that includes platform-specific implementation code for
Android and/or iOS.

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.

#Andirid 
##���û�������(proguard-rules.pro)
###ct�����˺�SDK
-keep class com.cmic.sso.sdk.**{*;}
-keep class cn.com.chinatelecom.account.**{*;}
### cmcc�й��ƶ�һ�����ܵ�¼
-dontwarn com.cmic.sso.sdk.**
-keep class com.cmic.sso.sdk.**{*;}
###cu С�ֿƼ����ܵ�¼sdk
-dontwarn com.unicom.xiaowo.login.**
-keep class com.unicom.xiaowo.login.**{*;}
-dontwarn com.sdk.**
-keep class com.sdk.** { *;}
###cmcc
-dontwarn com.cmcc.allnetlogin.**
-keep class com.cmcc.allnetlogin.client.**{*;}
-keep class com.cmcc.allnetlogin.model.**{*;}
-keep class com.cmcc.allnetlogin.http.**{*;}
-keep class com.cmcc.allnetlogin.utils.**{*;}
-keep class org.apache.commons.codec1.**{*;}
###emay
-keep class cn.emay.ql.UniSDK{*;}
-keep class cn.emay.ql.LoginCallback{*;}
-keep class cn.emay.ql.UniLoginActivity{*;}
-keep class cn.emay.ql.utils.**{*;}

##�Զ���UI,COPY
activity_oauth.xml  //��ͨ��¼ҳ��
ct_account_auth_activity_dynamic.xml    //������ͨ��¼ҳ��
ct_account_mini_auth_activity_dynamic.xml   //���ŵ�����¼ҳ��
�����ļ�������Ŀ layout Ŀ¼��

