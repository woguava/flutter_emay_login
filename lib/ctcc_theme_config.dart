//电信页面设置
import 'package:json_annotation/json_annotation.dart';

part 'ctcc_theme_config.g.dart';

@JsonSerializable(nullable: false)
class CTCCThemeConfig{
  ///授权页导航栏
  int navColor; ///设置导航栏颜色
  int barStyle; ///状态栏着色样式
  int navLineColor; ///导航栏底部横线颜色
  String navText; ///设置导航栏标题文字
  int navTextSize; ///导航栏标题字体大小
  int navTextColor; ///设置导航栏标题文字颜色
  String navGoBackImg_normal;  ///导航返回图标 正常
  String navGoBackImg_highlighted; ///导航返回图标 选中高亮

  ///logo配置
  String logoImg; ///LOGO图片
  int logoOffsetY; ///该控件顶部（top）相对于屏幕（safeArea）的顶部（top）的距离
  bool logoHidden;  ///LOGO图片是否隐藏
  int logoWidth; ///LOGO宽度
  int logoHeight; ///LOGO高度

  ///手机号标签配置
  int numberColor; ///手机号码字体颜色
  int numberTextSize; ///手机号码字体大小
  int numFieldOffsetY;  ///号码栏Y偏移量

  ///中部小logo及标签配置
  int brandLabelOffsetY; ///品牌logo图片及标签的Y偏移量
  int brandLabelTextColor;  ///品牌标签文字颜色
  int brandLabelTextSize; ///品牌标签字体大小

  ///登录按钮配置
  String logBtnText; ///登录按钮文本
  int logBtnOffsetY;  ///登录按钮Y偏移量
  int logBtnTextColor;  ///登录按钮文本颜色
  int logBtnWidth;  ///登录按钮宽度
  int logBtnHeight; ///若需单独修改登录按钮的高度，宽度logBtnWidth不传值或者传0即可
  int logBtnTextSize;   ///登录按钮字体大小
  int logBtnBackground; ///登录按钮的背景 可选设置为背景颜色、背景图片，若不传值即为默认，即选择使用xib默认背景
  int logBtnCornerRadius; ///登录按钮圆角设置
  int logBtnBgColor_normal; ///登录按钮背景颜色 正常
  int logBtnBgColor_disable; ///登录按钮背景颜色 不可按状态
  int logBtnBgColor_highlighted; ///登录按钮背景颜色 按下高亮
  String logBtnImgPath; ///设置授权登录按钮图片 [激活状态的图片,不可按状态的图片,高亮状态的图片]
  String loadingImg; ///loading图片

  ///其他登录方式按钮配置
  String otherWayLogBtnText; ///文本
  int otherWayLogBtnOffsetY; ///Y偏移量
  int otherWayLogBtnTextColor_normal; ///文本颜色 正常
  int otherWayLogBtnTextColor_highlighted; ///文本颜色 高亮
  int otherWayLogBtnTextSize; ///字体大小
  bool otherWayLogBtnHidden; ///是否隐藏

  ///勾选按钮和隐私协议标签
  bool checkState;  //默认勾选
  String checkBtnImg_unchecked; ///勾选按钮未选中图片
  String checkBtnImg_checked; ///勾选按钮已选中图片
  String clauseOneName; ///设置开发者隐私条款1名称和URL(名称，url)
  String clauseOneUrl;
  String clauseTwoName; ///设置开发者隐私条款2名称和URL(名称，url)
  String clauseTwoUrl;
  String appShowName;
  int appPrivacyAgreeColor; ///隐私条款名称颜色（协议）
  int appPrivacyTextColor; ///隐私条款文字颜色
  int appPrivacyTextSize; ///隐私条款文字字体大小
  int privacyOffsetY; ///设置隐私条款相对于标题栏下边缘y偏移
  
  CTCCThemeConfig({
    int navColor : -16742704,
    int barStyle : 0,
    int navLineColor : -1,
    String navText : "统一认证登录",
    int navTextSize : 17,
    int navTextColor : -1,
    String navGoBackImg_normal : "ctcc_return_bg_normal",
    String navGoBackImg_highlighted : "ctcc_return_bg_highlighted",
    String logoImg : "ctcc_login_logo",
    int logoOffsetY : 100,
    bool logoHidden : false,
    int logoWidth : 70,
    int logoHeight : 70,
    int numberColor : -16742704,
    int numberTextSize : 18,
    int numFieldOffsetY : 184,
    int brandLabelOffsetY : 190,
    int brandLabelTextColor : -16742704,
    int brandLabelTextSize : 18,
    String logBtnText : "本机号码一键登录",
    int logBtnOffsetY : 254,
    int logBtnTextColor : -1,
    int logBtnWidth : 100,
    int logBtnHeight : 0,
    int logBtnTextSize : 18,
    int logBtnBackground : 0,
    int logBtnCornerRadius : 2,
    int logBtnBgColor_normal : -16742704,
    int logBtnBgColor_disable : -16742704,
    int logBtnBgColor_highlighted : -16742704,
    String logBtnImgPath : "ctcc_login_btn_bg",
    String loadingImg : "ctcc_loading_img",
    String otherWayLogBtnText : "切换账号",
    int otherWayLogBtnOffsetY : 300,
    int otherWayLogBtnTextColor_normal : -16742704,
    int otherWayLogBtnTextColor_highlighted : -16742704,
    int otherWayLogBtnTextSize : 18,
    bool otherWayLogBtnHidden : false,
    bool checkState : false,
    String checkBtnImg_unchecked : "ctcc_uncheck_image",
    String checkBtnImg_checked : "ctcc_check_image",
    String clauseOneName,
    String clauseOneUrl,
    String clauseTwoName,
    String clauseTwoUrl,
    String appShowName,
    int appPrivacyAgreeColor : -16007674,
    int appPrivacyTextColor : -10066330,
    int appPrivacyTextSize: 10,
    int privacyOffsetY : 0,
  }){
    this.navColor=              navColor;
    this.barStyle=               barStyle;
    this.navLineColor=          navLineColor;
    this.navText=      navText;
    this.navTextSize =   navTextSize;
    this.navTextColor=         navTextColor;
    this.navGoBackImg_normal=           navGoBackImg_normal;
    this.navGoBackImg_highlighted=             navGoBackImg_highlighted;
    this.logoImg=            logoImg;
    this.logoOffsetY=           logoOffsetY;
    this.logoHidden=         logoHidden;
    this.logoWidth=            logoWidth;
    this.logoHeight=           logoHeight;
    this.numberColor=            numberColor;
    this.numberTextSize=       numberTextSize;
    this.numFieldOffsetY=     numFieldOffsetY;
    this.brandLabelOffsetY=            brandLabelOffsetY;
    this.brandLabelTextColor=       brandLabelTextColor;
    this.brandLabelTextSize=         brandLabelTextSize;
    this.logBtnText=         logBtnText;
    this.logBtnOffsetY=       logBtnOffsetY;
    this.logBtnTextColor=       logBtnTextColor;
    this.logBtnWidth=    logBtnWidth;
    this.logBtnHeight=         logBtnHeight;
    this.logBtnTextSize=       logBtnTextSize;
    this.logBtnBackground=       logBtnBackground;
    this.logBtnCornerRadius=         logBtnCornerRadius;
    this.logBtnBgColor_normal=          logBtnBgColor_normal;
    this.logBtnBgColor_disable=         logBtnBgColor_disable;
    this.logBtnBgColor_highlighted=          logBtnBgColor_highlighted;
    this.logBtnImgPath=       logBtnImgPath;
    this.loadingImg=      loadingImg;
    this.otherWayLogBtnText=      otherWayLogBtnText;
    this.otherWayLogBtnOffsetY=        otherWayLogBtnOffsetY;
    this.otherWayLogBtnTextColor_normal=        otherWayLogBtnTextColor_normal;
    this.otherWayLogBtnTextColor_highlighted=      otherWayLogBtnTextColor_highlighted;
    this.otherWayLogBtnTextSize=          otherWayLogBtnTextSize;
    this.otherWayLogBtnHidden=       otherWayLogBtnHidden;
    this.checkState=         checkState;
    this.checkBtnImg_unchecked=       checkBtnImg_unchecked;
    this.checkBtnImg_checked=     checkBtnImg_checked;
    this.clauseOneName=         clauseOneName;
    this.clauseOneUrl=          clauseOneUrl;
    this.clauseTwoName=         clauseTwoName;
    this.clauseTwoUrl=          clauseTwoUrl;
    this.appShowName=            appShowName;
    this.appPrivacyAgreeColor=    appPrivacyAgreeColor;
    this.appPrivacyTextColor=         appPrivacyTextColor;
    this.appPrivacyTextSize=      appPrivacyTextSize;
    this.privacyOffsetY=    privacyOffsetY;
  }

  factory CTCCThemeConfig.fromJson(Map<String, dynamic> json) => _$CTCCThemeConfigFromJson(json);

  Map<String, dynamic> toJson() => _$CTCCThemeConfigToJson(this);
}
