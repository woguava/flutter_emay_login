//联通页面设置

import 'package:json_annotation/json_annotation.dart';

part 'cucc_theme_config.g.dart';

@JsonSerializable(nullable: false)
class CUCCThemeConfig{
  ///授权页背景
  int backgroundColor; ///授权页背景颜色
  String bgImage;  ///设置授权页背景图片
  int controllerType; ///授权页弹出方式 默认使用PUSH

  ///授权页导航栏
  bool navBottomLineHidden;  ///隐藏导航栏尾部线条(默认显示)
  bool navBarHidden;  ///导航栏隐藏
  bool navTranslucent;  ///导航栏透明
  int navBgColor; ///导航栏背景颜色
  int navColor; ///设置导航栏颜色
  String navBgImage; ///导航栏背景图片
  String navText; ///设置导航栏标题文字
  int navTextFont; ///导航栏标题字体
  int navTextColor; ///设置导航栏标题文字颜色
  String navReturnImg;  ///设置导航栏返回按钮图标
  ///导航栏右侧自定义控件
  bool navCustomBtnHidden;
  String navCustomBtnText;
  int navCustomBtnTextColor;
  int navCustomBtnTextSize;

  ///自定义区域（导航下方）设置
  int topCustomHeight; ///自定义区域高度

  ///授权页logo
  String logoImgPath; ///设置logo图片
  int logoWidth;  ///设置logo宽度
  int logoHeight; ///设置logo高度
  int logoOffsetY; ///设置logo相对于标题栏下边缘y偏移

  ///应用名称设置
  bool appNameHidden; ///隐藏应用名（默认隐藏）
  int appNameColor; ///应用名字体颜色
  int appNameFont; ///应用名字体
  int appNameOffsetY; ///应用名Y偏移量

  ///授权页号码栏
  int numberColor;  ///手机号码字体颜色
  int numberFont;  ///手机号码字体
  int numFieldOffsetY; ///手机号码Y偏移量

  ///品牌设置
  int brandColor; ///认证服务品牌文字颜色
  int brandFont;  ///认证服务品牌文字字体
  int brandOffsetY; ///认证服务品牌Y偏移量
  bool brandHidden; ///隐藏认证服务品牌（默认显示）

  ///登录按钮设置
  String logBtnText; ///设置登录按钮文字
  int logBtnTextFont; ///登录按钮字体
  int logBtnTextColor; ///登录按钮文本颜色
  int logBtnOffsetY; ///登录按钮Y偏移量
  int logBtnRadius;   ///登录按钮圆角
  int logBtnUsableBGColor;  ///登录按钮背景颜色(可用状态)
  int logBtnUnusableBGColor;  ///登录按钮背景颜色(不可用状态)
  int logBtnLeading;  ///登录按钮宽度 (<=0无效）  loginButtonWidth（实际宽度） = screenWidth - logBtnLeading*2
  int logBtnHeight; ///登录按钮高度 (<=0无效)

  ///其他登录方式设置“切换账号”
  bool switchAccHidden; ///隐藏其他登录方式按钮（默认显示）
  String switchText; ///其他登录方式按钮文本
  int switchAccTextColor; ///设置切换账号字体颜色
  int swithAccTextFont; ///其他登录方式字体
  int switchOffsetY; ///其他登录方式Y偏移量
  int swithAccOffsetX;  ///其他登录方式X偏移量 (默认30)
  int swithAccTextAlignment; ///其他登录方式按钮文本对齐方式 默认右对齐

  ///隐私条款设置
  bool checkBoxHidden; ///隐藏复选框（默认显示）
  bool checkBoxValue; ///复选框默认值（默认不选中）
  int checkBoxWidth; ///复选框宽度（宽度=高度） <=0无效
  String checkBoxCheckedImg; ///复选框选中时图片
  String checkBoxNormalImg; ///复选框未选中时图片
  int privacyOffsetY; ///隐私条款Y偏移量 (隐私条款和复选框整体的偏移)
  int privacyTextColor;   ///隐私条款颜色
  int privacyColor;   ///隐私条款协议颜色

  String appFPrivacyId; ///xml布局中定义的控件id Android
  String appFPrivacyText; ///开发者隐私条款协议名称（第一个协议）
  String appFPrivacyUrl;  ///开发者隐私条款协议url（第一个协议）
  String appSPrivacyId; ///xml布局中定义的控件id Android
  String appSPrivacyText; ///开发者隐私条款协议名称（第二个协议）
  String appSPrivacyUrl; ///开发者隐私条款协议url（第二个协议）
  int checkBoxOffsetY; ///隐私条款左边的复选框Y偏移量 （相对于隐私条款的偏移）
  int privacyTextAlignment; ///隐私条款文本的对齐方式； 默认居中

  ///loading设置
  String loadingText; ///loading提示文字
  int loadingTextColor; ///loading提示文字颜色
  int loadingTextFont;  ///loading提示文字字体
  int loadingTextHeight;  ///loading提示文字高度
  int loadingBgWidth; ///loading背景宽度
  int loadingBgHeight;  ///loading背景高度
  int loadingBgRadius;  ///loading背景圆角
  int loadingBgColor; ///loading背景色

  ///协议页设置
  bool ifAddPrivacyPageBG; ///如果授权页设置了透明导航栏 在点击打开协议时 是否为协议页添加背景 (默认不透明白色)

  ///tip设置
  int tipOffsetY; ///提示的偏移 = 0无效

  CUCCThemeConfig({
    int backgroundColor : -1,
    String bgImage : "cucc_root_bg",
    int controllerType : 0,

    bool navBottomLineHidden : true,
    bool navBarHidden : false,
    bool navTranslucent : true,
    int navBgColor : -1,
    int navColor : -16742704,
    String navBgImage : "cucc_nav_bg",
    String navText : "统一认证登录",
    int navTextFont : 17,
    int navTextColor : -1,
    String navReturnImg: "cucc_return_bg",

    bool navCustomBtnHidden : true,
    String navCustomBtnText : "其它",
    int navCustomBtnTextColor : -1,
    int navCustomBtnTextSize : 15,

    int topCustomHeight : 0,

    String logoImgPath : "cucc_login_logo",
    int logoWidth : 70,
    int logoHeight : 70,
    int logoOffsetY : 100,

    bool appNameHidden : true,
    int appNameColor : -1,
    int appNameFont : 17,
    int appNameOffsetY : 130,

    int numberColor : -16742704,
    int numberFont : 18,
    int numFieldOffsetY : 184,

    int brandColor : -10066330,
    int brandFont : 17,
    int brandOffsetY : 200,
    bool brandHidden : true,

    String logBtnText : "本机号码一键登录",
    int logBtnTextFont : 20,
    int logBtnTextColor : -1,
    int logBtnOffsetY : 254,
    int logBtnRadius : 2,
    int logBtnUsableBGColor : -16742704,
    int logBtnUnusableBGColor : -16742704,
    int logBtnLeading : 10,
    int logBtnHeight : 20,

    bool switchAccHidden : false,
    String switchText : "切换账号",
    int switchAccTextColor : -11365671,
    int swithAccTextFont : 17,
    int switchOffsetY : 300,
    int swithAccOffsetX : 30,
    int swithAccTextAlignment : 1,

    bool checkBoxHidden : true,
    bool checkBoxValue : false,
    int checkBoxWidth : 30,
    String checkBoxCheckedImg : "cucc_uncheck_image",
    String checkBoxNormalImg : "cucc_check_image",
    int privacyOffsetY : 0,
    int privacyTextColor : -10066330,
    int privacyColor : -16007674,

    String appFPrivacyId : "protocol_1",
    String appFPrivacyText,
    String appFPrivacyUrl,
    String appSPrivacyId : "protocol_2",
    String appSPrivacyText,
    String appSPrivacyUrl,
    int checkBoxOffsetY : 0,
    int privacyTextAlignment : 0,

    String loadingText : "加载中...",
    int loadingTextColor : -10066330,
    int loadingTextFont : 18,
    int loadingTextHeight : 30,
    int loadingBgWidth : 160,
    int loadingBgHeight : 60,
    int loadingBgRadius : 2,
    int loadingBgColor : -1,

    bool ifAddPrivacyPageBG : false,

    int tipOffsetY : 0,
  }){
    this.backgroundColor=              backgroundColor;
    this.bgImage=               bgImage;
    this.controllerType=          controllerType;

    this.navBottomLineHidden=      navBottomLineHidden;
    this.navBarHidden =   navBarHidden;
    this.navTranslucent=         navTranslucent;
    this.navBgColor=           navBgColor;
    this.navColor=             navColor;
    this.navBgImage=            navBgImage;
    this.navText=           navText;
    this.navTextFont=         navTextFont;
    this.navTextColor=            navTextColor;
    this.navReturnImg=           navReturnImg;
    this.navCustomBtnHidden=            navCustomBtnHidden;
    this.navCustomBtnText=       navCustomBtnText;
    this.navCustomBtnTextColor=     navCustomBtnTextColor;
    this.navCustomBtnTextSize=            navCustomBtnTextSize;
    this.topCustomHeight=       topCustomHeight;
    this.logoImgPath=         logoImgPath;
    this.logoWidth=         logoWidth;
    this.logoHeight=       logoHeight;
    this.logoOffsetY=       logoOffsetY;
    this.appNameHidden=    appNameHidden;
    this.appNameColor=         appNameColor;
    this.appNameFont=       appNameFont;
    this.appNameOffsetY=       appNameOffsetY;
    this.numberColor=         numberColor;
    this.numberFont=          numberFont;
    this.numFieldOffsetY=         numFieldOffsetY;
    this.brandColor=          brandColor;
    this.brandFont=       brandFont;
    this.brandOffsetY=      brandOffsetY;
    this.brandHidden=      brandHidden;
    this.logBtnText=        logBtnText;
    this.logBtnTextFont=        logBtnTextFont;
    this.logBtnTextColor=      logBtnTextColor;
    this.logBtnOffsetY=          logBtnOffsetY;
    this.logBtnRadius=       logBtnRadius;
    this.logBtnUsableBGColor=         logBtnUsableBGColor;
    this.logBtnUnusableBGColor=       logBtnUnusableBGColor;
    this.logBtnLeading=     logBtnLeading;
    this.logBtnHeight=            logBtnHeight;
    this.switchAccHidden=         switchAccHidden;
    this.switchText=    switchText;
    this.switchAccTextColor  =    switchAccTextColor;
    this.swithAccTextFont  =        swithAccTextFont;
    this.switchOffsetY  =      switchOffsetY;
    this.swithAccOffsetX=   swithAccOffsetX;
    this.swithAccTextAlignment=    swithAccTextAlignment;
    this.checkBoxHidden =   checkBoxHidden;
    this.checkBoxValue = checkBoxValue;
    this.checkBoxWidth = checkBoxWidth;
    this.checkBoxCheckedImg = checkBoxCheckedImg;
    this.checkBoxNormalImg =  checkBoxNormalImg;
    this.privacyOffsetY = privacyOffsetY;
    this.privacyTextColor = privacyTextColor;
    this.privacyColor = privacyColor;
    this.appFPrivacyId = appFPrivacyId;
    this.appFPrivacyText = appFPrivacyText;
    this.appFPrivacyUrl = appFPrivacyUrl;
    this.appSPrivacyId = appSPrivacyId;
    this.appSPrivacyText = appSPrivacyText;
    this.appSPrivacyUrl = appSPrivacyUrl;
    this.checkBoxOffsetY = checkBoxOffsetY;
    this.privacyTextAlignment = privacyTextAlignment;
    this.loadingText = loadingText;
    this.loadingTextColor = loadingTextColor;
    this.loadingTextFont = loadingTextFont;
    this.loadingTextHeight = loadingTextHeight;
    this.loadingBgWidth = loadingBgWidth;
    this.loadingBgHeight = loadingBgHeight;
    this.loadingBgRadius = loadingBgRadius;
    this.loadingBgColor = loadingBgColor;
    this.ifAddPrivacyPageBG = ifAddPrivacyPageBG;
    this.tipOffsetY = tipOffsetY;
  }

  factory CUCCThemeConfig.fromJson(Map<String, dynamic> json) => _$CUCCThemeConfigFromJson(json);

  Map<String, dynamic> toJson() => _$CUCCThemeConfigToJson(this);
}
