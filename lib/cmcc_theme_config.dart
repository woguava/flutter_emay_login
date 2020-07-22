//移动页面配置

import 'package:json_annotation/json_annotation.dart';

part 'cmcc_theme_config.g.dart';

@JsonSerializable(nullable: false)
class CMCCThemeConfig{
  ///授权界面
  String authBGImgPath;  ///设置授权页背景图片
  int presentType;   ///授权页面推出的动画效果 ( 0-底部  present默认效果；1-右边  导航栏效果；2-上面；3-左边)

  ///授权页导航栏
  int barStyle; ///状态栏着色样式(隐藏导航栏无效)  0为黑色,1为白色 （ios）
  int statusBarStyle; ///状态栏着色样式(隐藏导航栏时有效)  0为黑色,1为白色 （ios）
  int statusBarColor; ///设置状态栏颜色（Android）
  int navColor; ///设置导航栏颜色
  String navText; ///设置导航栏标题文字
  int navTextColor; ///设置导航栏标题文字颜色
  int navTextSize; ///设置导航栏标题字号大小
  String navReturnImgPath;  ///设置导航栏返回按钮图标
  int navReturnImgSize; ///返回按钮大小 (Android)
  bool authNavTransparent; ///设置授权页导航栏透明 （适配全屏图片）
  ///导航栏右侧自定义按钮
  bool navCustomBtnHidden;
  String navCustomBtnText;
  int navCustomBtnTextColor;
  int navCustomBtnTextSize;

  ///授权页logo
  String logoImgPath; ///设置logo图片
  int logoWidth;  ///设置logo宽度
  int logoHeight; ///设置logo高度
  int logoOffsetY; ///设置logo相对于标题栏下边缘y偏移
  bool logoHidden;  ///隐藏logo

  ///授权页登录按钮
  String logBtnText; ///设置登录按钮文字
  int logBtnTextColor; ///设置登录按钮文字颜色
  String logBtnImgPath; ///设置授权登录按钮图片 ios[激活状态的图片,失效状态的图片,高亮状态的图片]
  int logBtnOffsetY; ///设置登录按钮相对于标题栏下边缘y偏移
  int logBtnOriginX; ///登录按钮的左右边距 注意:按钮呈现的宽必须大于屏幕的一半
  int logBtnHeight;  ///登录按钮高h 注意：必须大于40
  int logBtnSize;  ///Android

  ///授权页号码栏
  int numberColor;  ///设置手机号码字体颜色
  int numberSize;  ///设置号码栏字体大小
  int numberOffsetY; ///设置号码栏相对于标题栏下边缘y偏移
  int numberOffsetX; ///号码栏X偏移量

  ///切换账号
  bool switchAccHidden; ///隐藏“切换账号”
  String switchAccText; ///设置“切换账号”文字
  int switchAccTextColor; ///设置切换账号字体颜色
  int switchAccTextSize;  ///设置切换账号字体大小
  int switchOffsetY; ///设置切换账号相对于标题栏下边缘y偏移

  ///授权页隐私栏
  String uncheckedImgPath; ///设置复选框未选中时图片
  String checkedImgPath;  ///设置复选框选中时图片
  int checkboxWH; ///复选框大小（只能正方形）必须大于12
  int appPrivacyOriginX; ///隐私条款（包括check框）的左右边距
  String clauseOneName; ///设置开发者隐私条款1名称和URL(名称，url)
  String clauseOneUrl;
  String clauseTwoName; ///设置开发者隐私条款2名称和URL(名称，url)
  String clauseTwoUrl;
  int appPrivacyAlignment; ///隐私条款文字内容的方向:默认是居左 0 右 1
  int appPrivacyAgreeColor; ///隐私条款名称颜色（协议）
  int appPrivacyTextColor; ///隐私条款文字颜色
  int appPrivacyTextSize; ///隐私条款文字字体大小
  int privacyOffsetY; ///设置隐私条款相对于标题栏下边缘y偏移
  bool privacyState;  ///隐私条款check框默认状态 是否默认勾选
  bool privacySymbol; ///隐私条款默认协议是否开启书名号

  ///授权页slogan 底部标识Title
  String sloganText;  ///设置移动slogan文字
  int sloganTextSize; ///设置移动slogan文字大小
  int sloganTextColor; ///设置移动slogan文字颜色
  int sloganOffsetY; ///设置slogan相对于标题栏下边缘y偏移

  ///自定义控件 授权页面允许开发者在授权页面body添加自定义的控件
  String customBodyBtnText;
  int customBodyBtnTextColor;
  int customBodyBtnTextSize;
  bool customBodyBtnHidden;
  int customBodyBtnOffsetY;

  CMCCThemeConfig({
    String authBGImgPath : "cmcc_authpage_bg",
    int presentType : 0,

    int statusBarColor : -16742704,
    int navColor : -16742704,
    int barStyle : 0,
    int statusBarStyle :0,
    String navText : "统一认证登录",
    int navTextColor : -1,
    int navTextSize : 17,
    String navReturnImgPath : "cmcc_return_bg",
    int navReturnImgSize: 30,
    bool authNavTransparent : false,

    bool navCustomBtnHidden : true,
    String navCustomBtnText : "其它",
    int navCustomBtnTextColor : -1,
    int navCustomBtnTextSize : 15,

    String logoImgPath : "cmcc_login_logo",
    int logoWidth : 70,
    int logoHeight : 70,
    int logoOffsetY : 100,
    bool logoHidden : false,

    String logBtnText : "本机号码一键登录",
    int logBtnTextColor : -1,
    String logBtnImgPath : "cmcc_login_btn_bg",
    int logBtnOffsetY : 254,
    int logBtnOriginX : 50,
    int logBtnHeight : 40,
    int logBtnSize : 15,

    int numberColor : -16742704,
    int numberSize : 18,
    int numberOffsetY : 184,
    int numberOffsetX : 50,

    bool switchAccHidden:false,
    String switchAccText : "切换账号",
    int switchAccTextColor : -11365671,
    int switchAccTextSize : 20,
    int switchOffsetY : 300,

    String uncheckedImgPath : "cmcc_uncheck_image",
    String checkedImgPath : "cmcc_check_image",
    int checkboxWH : 30,
    int appPrivacyOriginX : 80,
    String clauseOneName,
    String clauseOneUrl,
    String clauseTwoName,
    String clauseTwoUrl,
    int appPrivacyAlignment : 0,
    int appPrivacyAgreeColor : -16007674,
    int appPrivacyTextColor : -10066330,
    int appPrivacyTextSize: 10,
    int privacyOffsetY : 0,
    bool privacyState : false,
    bool privacySymbol : true,

    String sloganText : "中国移动通信",
    int sloganTextSize : 17,
    int sloganTextColor : -10066330,
    int sloganOffsetY : 230,

    String customBodyBtnText : "其它方式登录",
    int customBodyBtnTextColor : -60338,
    int customBodyBtnTextSize : 13,
    bool customBodyBtnHidden : true,
    int customBodyBtnOffsetY : 450
  }){
    this.authBGImgPath=     authBGImgPath;
    this.presentType=       presentType;

    this.statusBarColor  = statusBarColor;
    this.navColor=          navColor;
    this.barStyle=          barStyle;
    this.statusBarStyle =   statusBarStyle;
    this.navText=           navText;
    this.navTextColor=            navTextColor;
    this.navTextSize=             navTextSize;
    this.navReturnImgPath=        navReturnImgPath;
    this.navReturnImgSize=        navReturnImgSize;
    this.authNavTransparent=      authNavTransparent;

    this.navCustomBtnHidden=         navCustomBtnHidden;
    this.navCustomBtnText=           navCustomBtnText;
    this.navCustomBtnTextColor=      navCustomBtnTextColor;
    this.navCustomBtnTextSize=       navCustomBtnTextSize;

    this.logoImgPath=       logoImgPath;
    this.logoWidth=     logoWidth;
    this.logoHeight=            logoHeight;
    this.logoOffsetY=       logoOffsetY;
    this.logoHidden=         logoHidden;

    this.logBtnText=         logBtnText;
    this.logBtnTextColor=       logBtnTextColor;
    this.logBtnImgPath=       logBtnImgPath;
    this.logBtnOffsetY=    logBtnOffsetY;
    this.logBtnOriginX=         logBtnOriginX;
    this.logBtnHeight=       logBtnHeight;
    this.logBtnSize=         logBtnSize;

    this.numberColor=       numberColor;
    this.numberSize=         numberSize;
    this.numberOffsetY=         numberOffsetY;
    this.numberOffsetX=         numberOffsetX;

    this.switchAccHidden=          switchAccHidden;
    this.switchAccText=       switchAccText;
    this.switchAccTextColor=      switchAccTextColor;
    this.switchAccTextSize=      switchAccTextSize;
    this.switchOffsetY=        switchOffsetY;

    this.uncheckedImgPath=        uncheckedImgPath;
    this.checkedImgPath=      checkedImgPath;
    this.checkboxWH=          checkboxWH;
    this.appPrivacyOriginX=       appPrivacyOriginX;
    this.sloganOffsetY=         sloganOffsetY;
    this.clauseOneName=         clauseOneName;
    this.clauseOneUrl=          clauseOneUrl;
    this.clauseTwoName=         clauseTwoName;
    this.clauseTwoUrl=          clauseTwoUrl;
    this.appPrivacyAlignment=     appPrivacyAlignment;
    this.appPrivacyAgreeColor=    appPrivacyAgreeColor;
    this.appPrivacyTextColor=         appPrivacyTextColor;
    this.appPrivacyTextSize=      appPrivacyTextSize;
    this.privacyOffsetY=    privacyOffsetY;
    this.privacyState  =    privacyState;
    this.privacySymbol  =        privacySymbol;

    this.sloganText  =      sloganText;
    this.sloganTextSize=   sloganTextSize;
    this.sloganTextColor=    sloganTextColor;
    this.sloganOffsetY =   sloganOffsetY;

    this.customBodyBtnText =  customBodyBtnText;
    this.customBodyBtnTextColor = customBodyBtnTextColor;
    this.customBodyBtnTextSize = customBodyBtnTextSize;
    this.customBodyBtnHidden = customBodyBtnHidden;
    this.customBodyBtnOffsetY = customBodyBtnOffsetY;
  }

  factory CMCCThemeConfig.fromJson(Map<String, dynamic> json) => _$CMCCThemeConfigFromJson(json);

  Map<String, dynamic> toJson() => _$CMCCThemeConfigToJson(this);
}
