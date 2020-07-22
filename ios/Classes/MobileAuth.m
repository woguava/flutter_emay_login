#import "MobileAuth.h"
#import "UniLogin.h"

#define TITLE_BTN @"1"
#define BODY_BTN  @"2"

UIColor *hexColor(long hex) {
    long red = (hex & 0xff0000) >> 16;
    long green = (hex & 0x00ff00) >> 8;
    long blue = (hex & 0x0000ff) >> 0;
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:1.0];
};

BOOL isExistKeyValue(NSDictionary* dict, NSString* key ) {
    if(![dict objectForKey:key]){
        return NO;
    }
    id obj = [dict objectForKey:key];
    return ![obj isEqual:[NSNull null]];
}

@implementation MobileAuth

FlutterResult _result;
UIViewController *_viewController;


/**
 *自定义按钮事件处理
 */
+ (void)customBodyAction{
    [_viewController dismissViewControllerAnimated:YES completion:nil];
    _result(@{@"resultCode":@"200020",@"btnType":BODY_BTN});
    
}

/**
 *自定义头按钮事件处理
 */
+(void)customTitleAction{
    [_viewController dismissViewControllerAnimated:YES completion:nil];
    _result(@{@"resultCode":@"200020",@"btnType":TITLE_BTN});
}


//移动model设置
+(UACustomModel *)createCMCCModel:(NSDictionary *)themeConfigDict{
    UACustomModel *model = [UACustomModel new];
    model.currentVC = _viewController;
    
    //授权界面自定义控件
    BOOL custBodyBtnHid = isExistKeyValue(themeConfigDict,@"customBodyBtnHidden") ? [[themeConfigDict objectForKey:@"customBodyBtnHidden"] boolValue]: YES;

//    if(!custBodyBtnHid){
//        model.authViewBlock = ^(UIView *customView){
//            UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
//           [btn setTitle:[themeConfigDict objectForKey:@"customBodyBtnText"] forState:UIControlStateNormal];
//           btn.enabled = YES;
//           btn.titleLabel.font = [UIFont systemFontOfSize:[[themeConfigDict objectForKey:@"customBodyBtnTextSize"] intValue]];
//           long customBodyBtnHexTextColor = isExistKeyValue(themeConfigDict,@"customBodyBtnTextColor")  ? [[themeConfigDict objectForKey:@"customBodyBtnTextColor"] longValue]: -108766 ;
//           [btn setTitleColor:hexColor(customBodyBtnHexTextColor) forState:UIControlStateNormal];
//           [btn addTarget:self action:@selector(customBodyAction) forControlEvents:UIControlEventTouchUpInside];
//
//           CGRect screenBounds = [ [UIScreen mainScreen]bounds];
//           btn.frame = CGRectMake(0, [[themeConfigDict objectForKey:@"customBodyBtnOffsetY"] doubleValue], screenBounds.size.width-40, 100);
//           CGPoint tmpPoint = btn.center;
//           tmpPoint.x = screenBounds.size.width / 2;
//           btn.center = tmpPoint;
//           [customView addSubview:btn];
//        };
//    }
    
    //3、授权页面推出的动画效果
    model.presentType = isExistKeyValue(themeConfigDict,@"presentType")  ? [[themeConfigDict objectForKey:@"presentType"] intValue]: 3;
    //4、页面背景
    NSString * bgImgPath = isExistKeyValue(themeConfigDict,@"authBGImgPath") ? [themeConfigDict objectForKey:@"authBGImgPath"] : @"cmcc_root_bg";
    model.authPageBackgroundImage = [UIImage imageNamed:bgImgPath];
    
    
    //*****************导航栏**********************
    //5、导航栏颜色
    model.navColor = hexColor(isExistKeyValue(themeConfigDict,@"navColor") ? [[themeConfigDict objectForKey:@"navColor"] longValue]: -1);
    //6、状态栏着色样式0为黑色,1为白色
    model.barStyle = isExistKeyValue(themeConfigDict,@"barStyle")  ? [[themeConfigDict objectForKey:@"barStyle"] intValue]: 0;
    //7、状态栏着色样式(隐藏导航栏时有效)*/
    model.statusBarStyle = isExistKeyValue(themeConfigDict,@"statusBarStyle")  ? [[themeConfigDict objectForKey:@"statusBarStyle"] intValue]: 0;
    //8、导航栏标题颜色和字体修改  属性:你好  黄色
    NSString * navText = isExistKeyValue(themeConfigDict,@"navText") ? [themeConfigDict objectForKey:@"navText"] : @"统一认证登录";
    long navTextColor = isExistKeyValue(themeConfigDict,@"navTextColor")  ? [[themeConfigDict objectForKey:@"navTextColor"] longValue]: -1;
    model.navText = [[NSAttributedString alloc]initWithString:navText attributes:@{NSForegroundColorAttributeName:hexColor(navTextColor)}];
    //9、导航返回图标(尺寸根据图片大小)
    NSString * navReturnImgPath = isExistKeyValue(themeConfigDict,@"navReturnImgPath") ? [themeConfigDict objectForKey:@"navReturnImgPath"] : @"cmcc_return_bg";
    model.navReturnImg = [UIImage imageNamed:navReturnImgPath];
    //10、自定义导航栏开关(隐藏导航栏)--测试时留到最后设置
    model.navCustom = isExistKeyValue(themeConfigDict,@"authNavTransparent") ? [[themeConfigDict objectForKey:@"authNavTransparent"] boolValue]: NO;
    //11、右键按钮--
    BOOL navCustomBtnHidden = isExistKeyValue(themeConfigDict,@"navCustomBtnHidden") ? [[themeConfigDict objectForKey:@"navCustomBtnHidden"] boolValue]: YES;
    if(!navCustomBtnHidden){
      model.navControl = [[UIBarButtonItem alloc]initWithTitle:[themeConfigDict objectForKey:@"navCustomBtnText"] style:(UIBarButtonItemStyleDone) target:self action:@selector(customTitleAction)];
    }
    
    //***************** LOGO图片设置******************
    //12、logo图片
    NSString * logoImgPath = isExistKeyValue(themeConfigDict,@"logoImgPath") ? [themeConfigDict objectForKey:@"logoImgPath"] : @"cmcc_login_logo";
    model.logoImg = [UIImage imageNamed:logoImgPath];
    //13、Logo宽度设置
    model.logoWidth = isExistKeyValue(themeConfigDict,@"logoWidth")  ? [[themeConfigDict objectForKey:@"logoWidth"] intValue]: 180;
    //14、Logo的高度设置
    model.logoHeight = isExistKeyValue(themeConfigDict,@"logoHeight")  ? [[themeConfigDict objectForKey:@"logoHeight"] intValue]: 70;
    //15、Logo偏移量Y
    double _logoOffsetY = isExistKeyValue(themeConfigDict,@"logoOffsetY") ? [[themeConfigDict objectForKey:@"logoOffsetY"] doubleValue] : 100;
    model.logoOffsetY = [NSNumber numberWithFloat:_logoOffsetY];
    //16、Logo隐藏开关
    model.logoHidden = isExistKeyValue(themeConfigDict,@"logoHidden") ? [[themeConfigDict objectForKey:@"logoHidden"] boolValue] : YES;

    //***************** 登录按钮*******************
    //17、登录按钮
    NSString * logBtnText = isExistKeyValue(themeConfigDict,@"logBtnText") ? [themeConfigDict objectForKey:@"logBtnText"] : @"本机号码一键登录";
    long logBtnTextColor = isExistKeyValue(themeConfigDict,@"logBtnTextColor")  ? [[themeConfigDict objectForKey:@"logBtnTextColor"] longValue]: -1;
    model.logBtnText = [[NSAttributedString alloc]initWithString:logBtnText attributes:@{NSForegroundColorAttributeName:hexColor(logBtnTextColor)}];
    //18、按钮偏移量Y
    double _logBtnOffsetY = isExistKeyValue(themeConfigDict,@"logBtnOffsetY") ? [[themeConfigDict objectForKey:@"logBtnOffsetY"] doubleValue] : 100;
    model.logBtnOffsetY = [NSNumber numberWithFloat:_logBtnOffsetY];
    //19、按钮距离屏幕左右边距
    double _logBtnOriginX = isExistKeyValue(themeConfigDict,@"logBtnOriginX") ? [[themeConfigDict objectForKey:@"logBtnOriginX"] doubleValue] : 100;
    model.logBtnOriginX = [NSNumber numberWithFloat:_logBtnOriginX];
    //20、登录按钮的高h
    model.logBtnHeight = isExistKeyValue(themeConfigDict,@"logBtnHeight") ? [[themeConfigDict objectForKey:@"logBtnHeight"] doubleValue] : 12;
    //21、授权界面登录按钮
    NSString * logBtnImgPath = isExistKeyValue(themeConfigDict,@"logBtnImgPath") ? [themeConfigDict objectForKey:@"logBtnImgPath"] : @"cmcc_login_btn_bg";
    UIImage *logBtnNormal = [UIImage imageNamed: [NSString stringWithFormat:@"%@%s", logBtnImgPath, "_normal"] ];
    UIImage *logBtnInvalied = [UIImage imageNamed: [NSString stringWithFormat:@"%@%s", logBtnImgPath, "_unable"] ];
    UIImage *logBtnHighted = [UIImage imageNamed: [NSString stringWithFormat:@"%@%s", logBtnImgPath, "_press"] ];
    model.logBtnImgs = @[logBtnNormal,logBtnInvalied,logBtnHighted];
    
    //******************** 号码框设置*****************
    //22、号码栏字体大小
    long numberHexColor = isExistKeyValue(themeConfigDict,@"numberColor") ? [[themeConfigDict objectForKey:@"numberColor"] longValue]:  -108766 ;
    int numberSize = isExistKeyValue(themeConfigDict,@"numberSize") ? [[themeConfigDict objectForKey:@"numberSize"] intValue] : 30;
    
    model.numberText = [[NSAttributedString alloc]initWithString:@"" attributes:@{NSForegroundColorAttributeName:hexColor(numberHexColor),NSFontAttributeName:[UIFont systemFontOfSize:numberSize]}];
       
    //23、号码栏X偏移量
    double _numberOffsetX = isExistKeyValue(themeConfigDict,@"numberOffsetX") ? [[themeConfigDict objectForKey:@"numberOffsetX"] doubleValue] : 50;
    model.numberOffsetX = [NSNumber numberWithFloat:_numberOffsetX];
    //24、号码栏Y偏移量
    double _numberOffsetY = isExistKeyValue(themeConfigDict,@"numberOffsetY") ? [[themeConfigDict objectForKey:@"numberOffsetY"] doubleValue] : 100;
    model.numberOffsetY = [NSNumber numberWithFloat:_numberOffsetY];
        
    //25、切换按钮隐藏开关
    model.swithAccHidden = isExistKeyValue(themeConfigDict,@"switchAccHidden") ? [[themeConfigDict objectForKey:@"switchAccHidden"] boolValue]: YES;
    //26、切换账号
    NSString * switchAccText = isExistKeyValue(themeConfigDict,@"switchAccText") ? [themeConfigDict objectForKey:@"switchAccText"] : @"切换账号";
    long switchAccTextColor = isExistKeyValue(themeConfigDict,@"switchAccTextColor")  ? [[themeConfigDict objectForKey:@"switchAccTextColor"] longValue]: -108766 ;
    int switchAccTextSize = isExistKeyValue(themeConfigDict,@"switchAccTextSize") ? [[themeConfigDict objectForKey:@"switchAccTextSize"] intValue] : 30;
    model.switchAccText = [[NSAttributedString alloc]initWithString:switchAccText attributes:@{NSForegroundColorAttributeName:hexColor(switchAccTextColor),NSFontAttributeName:[UIFont systemFontOfSize:switchAccTextSize]}];
    //27、切换账号偏移量
    double _switchOffsetY = isExistKeyValue(themeConfigDict,@"switchOffsetY") ? [[themeConfigDict objectForKey:@"switchOffsetY"] doubleValue] : 300;
    model.switchOffsetY = [NSNumber numberWithFloat:_switchOffsetY];
    
        
    //******************* 隐私条款***************
    //28、隐私条款uncheckedImg选中图片
    NSString * uncheckedImgPath = isExistKeyValue(themeConfigDict,@"uncheckedImgPath") ? [themeConfigDict objectForKey:@"uncheckedImgPath"] : @"cmcc_uncheck_image";
    model.uncheckedImg = [UIImage imageNamed:uncheckedImgPath];
    //29、隐私条款chexBox选中图片
    NSString * checkedImgPath = isExistKeyValue(themeConfigDict,@"checkedImgPath") ? [themeConfigDict objectForKey:@"checkedImgPath"] : @"cmcc_check_image";
    model.checkedImg = [UIImage imageNamed:checkedImgPath];
    //30、复选框大小（只能正方形）必须大于12*/
    double _checkboxWH = isExistKeyValue(themeConfigDict,@"checkboxWH") ? [[themeConfigDict objectForKey:@"checkboxWH"] doubleValue] : 30;
    model.checkboxWH = [NSNumber numberWithFloat:_checkboxWH];
    //*31、隐私条款（包括check框）的左右边距*/
    double _appPrivacyOriginX= isExistKeyValue(themeConfigDict,@"appPrivacyOriginX") ? [[themeConfigDict objectForKey:@"appPrivacyOriginX"] doubleValue] : 80;
    model.appPrivacyOriginX = [NSNumber numberWithFloat:_appPrivacyOriginX];
    //32、隐私的内容模板
    NSMutableArray* privacyAttr = [NSMutableArray array];
    NSAttributedString * clauseOneAttr = nil;
    NSAttributedString * clauseTwoAttr = nil;
    NSMutableString *demo = [NSMutableString string];
    [demo appendString:@"登录即同意&&默认&&并授权"];
    if(isExistKeyValue(themeConfigDict,@"clauseOneName")  && isExistKeyValue(themeConfigDict,@"clauseOneUrl") ){
        [demo appendString:[themeConfigDict objectForKey:@"clauseOneName"]];
        clauseOneAttr = [[NSAttributedString alloc]initWithString:[themeConfigDict objectForKey:@"clauseOneName"] attributes:@{NSLinkAttributeName:[themeConfigDict objectForKey:@"clauseOneUrl"]}];
        [privacyAttr addObject:clauseOneAttr];
    }
    if(isExistKeyValue(themeConfigDict,@"clauseTwoName")  && isExistKeyValue(themeConfigDict,@"clauseTwoUrl") ){
        [demo appendString:@"、"];
        [demo appendString:[themeConfigDict objectForKey:@"clauseTwoName"]];
        clauseTwoAttr = [[NSAttributedString alloc]initWithString:[themeConfigDict objectForKey:@"clauseTwoName"] attributes:@{NSLinkAttributeName:[themeConfigDict objectForKey:@"clauseTwoUrl"]}];
        [privacyAttr addObject:clauseTwoAttr];
    }
    [demo appendString:@"使用本机号码登录"];
        
    long clauseBaseHexColor = isExistKeyValue(themeConfigDict,@"appPrivacyTextColor") ? [[themeConfigDict objectForKey:@"appPrivacyTextColor"] longValue]: -10066330 ;
    long clauseColorAgree = isExistKeyValue(themeConfigDict,@"appPrivacyAgreeColor")  ? [[themeConfigDict objectForKey:@"appPrivacyAgreeColor"] longValue]: -16007674 ;
    int clauseTextSize = isExistKeyValue(themeConfigDict,@"appPrivacyTextSize") ? [[themeConfigDict objectForKey:@"appPrivacyTextSize"] intValue] : 10;
    model.appPrivacyDemo = [[NSAttributedString alloc]initWithString:demo attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:clauseTextSize] ,NSForegroundColorAttributeName:hexColor(clauseBaseHexColor)}];
        
    //33、隐私条款文字内容的方向:默认是居左
    model.appPrivacyAlignment = NSTextAlignmentLeft;
    //34、隐私条款:数组对象
    model.appPrivacy = privacyAttr;
    //35、隐私条款名称颜色（协议）
    model.privacyColor = hexColor(clauseColorAgree);
    //36、隐私条款偏移量
    double _privacyOffsetY = isExistKeyValue(themeConfigDict,@"privacyOffsetY") ? [[themeConfigDict objectForKey:@"privacyOffsetY"] doubleValue] : 25;
    model.privacyOffsetY = [NSNumber numberWithFloat:_privacyOffsetY];
    //37、隐私条款check框默认状态
    model.privacyState = isExistKeyValue(themeConfigDict,@"privacyState") ? [[themeConfigDict objectForKey:@"privacyState"] boolValue] : YES;
    //38、隐私条款默认协议是否开启书名号
    model.privacySymbol = isExistKeyValue(themeConfigDict,@"privacySymbol") ? [[themeConfigDict objectForKey:@"privacySymbol"] boolValue] : YES;
    
    
    //******************* 底部标识Title***************
    //39、slogan偏移量
    double _sloganOffsetY  = isExistKeyValue(themeConfigDict,@"sloganOffsetY") ? [[themeConfigDict objectForKey:@"sloganOffsetY"] doubleValue] : 224;
    model.sloganOffsetY =  [NSNumber numberWithFloat:_sloganOffsetY];
    //40、slogan文案
    NSString * sloganText = isExistKeyValue(themeConfigDict,@"sloganText") ? [themeConfigDict objectForKey:@"sloganText"] : @"中国移动通信";
    long sloganTextHexColor = isExistKeyValue(themeConfigDict,@"sloganTextColor") ? [[themeConfigDict objectForKey:@"sloganTextColor"] longValue]: -10066330 ;
    int sloganTextSize = isExistKeyValue(themeConfigDict,@"sloganTextSize") ? [[themeConfigDict objectForKey:@"sloganTextSize"] intValue] : 17;
    
    model.sloganText = [[NSAttributedString alloc]initWithString:sloganText attributes:@{NSForegroundColorAttributeName:hexColor(sloganTextHexColor),NSFontAttributeName:[UIFont systemFontOfSize:sloganTextSize]}];

    return model;
}

//联通model设置
+(ZOAUCustomModel *)createCUCCModel:(NSDictionary *)themeConfigDict{
    ZOAUCustomModel *mAuthPage = [[ZOAUCustomModel alloc]init];
    
    mAuthPage.navBgColor = hexColor(isExistKeyValue(themeConfigDict,@"navBgColor") ? [[themeConfigDict objectForKey:@"navBgColor"] longValue]: -1);
        
    mAuthPage.navText= isExistKeyValue(themeConfigDict,@"navText") ? [themeConfigDict objectForKey:@"navText"] : @"统一认证登录";
    mAuthPage.navTextColor = hexColor(isExistKeyValue(themeConfigDict,@"navTextColor")  ? [[themeConfigDict objectForKey:@"navTextColor"] longValue]: -1) ;
    
    NSString * navReturnImg = isExistKeyValue(themeConfigDict,@"navReturnImg") ? [themeConfigDict objectForKey:@"navReturnImg"] : @"cmcc_return_bg";
    mAuthPage.navReturnImg = [UIImage imageNamed:navReturnImg];
        
    NSString * logoImgPath = isExistKeyValue(themeConfigDict,@"logoImgPath") ? [themeConfigDict objectForKey:@"logoImgPath"] : @"cmcc_login_logo";
    mAuthPage.logoImg = [UIImage imageNamed:logoImgPath];
    mAuthPage.logoWidth = isExistKeyValue(themeConfigDict,@"logoWidth")  ? [[themeConfigDict objectForKey:@"logoWidth"] intValue]: 180;
    mAuthPage.logoHeight = isExistKeyValue(themeConfigDict,@"logoHeight")  ? [[themeConfigDict objectForKey:@"logoHeight"] intValue]: 70;
    
    
    mAuthPage.logBtnText = isExistKeyValue(themeConfigDict,@"logBtnText") ? [themeConfigDict objectForKey:@"logBtnText"] : @"本机号码一键登录";

    mAuthPage.checkBoxValue = isExistKeyValue(themeConfigDict,@"checkBoxValue") ? [[themeConfigDict objectForKey:@"checkBoxValue"] boolValue] : YES;
    mAuthPage.ifStopListeningAuthPageClosed = YES; //取消授权页关闭回调
    mAuthPage.swithAccHidden = isExistKeyValue(themeConfigDict,@"switchAccHidden") ? [[themeConfigDict objectForKey:@"switchAccHidden"] boolValue]: YES;

    if(isExistKeyValue(themeConfigDict,@"appFPrivacyText")  && isExistKeyValue(themeConfigDict,@"appFPrivacyUrl") ){
        mAuthPage.appFPrivacyText = [themeConfigDict objectForKey:@"appFPrivacyText"];
        mAuthPage.appFPrivacyURL =  [themeConfigDict objectForKey:@"appFPrivacyUrl"];
    }
    if(isExistKeyValue(themeConfigDict,@"appSPrivacyText")  && isExistKeyValue(themeConfigDict,@"appSPrivacyUrl") ){
        mAuthPage.appSPrivacyText = [themeConfigDict objectForKey:@"appSPrivacyText"];
        mAuthPage.appSPrivacyURL =  [themeConfigDict objectForKey:@"appSPrivacyUrl"];
    }


    [[ZUOAuthManager getInstance] customUIWithParams:mAuthPage topCustomViews:^(UIView *customView) {
//            UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
//                        button.frame = CGRectMake(250, 60, 60, 30);
//                        button.backgroundColor = UIColor.redColor;
//                        [button setTitle:@"关闭" forState:UIControlStateNormal];
//                        [button addTarget:self action:@selector(test111) forControlEvents:UIControlEventTouchUpInside];
//                        [customView addSubview:button];
    } bottomCustomViews:^(UIView *customView) {

    }];

    return mAuthPage;
}

//电信model设置
+(EAccountOpenPageConfig *)createCTCCModel:(NSDictionary *)themeConfigDict{
    EAccountOpenPageConfig *config = [[EAccountOpenPageConfig alloc] init];
    config.nibNameOfLoginVC = @"EAccountAuthVC_dynamic"; //资源文件名配置

    // 设置电信授权页面弹出消失动画
    EACustomAnimatedTransitioning *obj = [[EACustomAnimatedTransitioning alloc] init];
    obj.targetEdge = UIRectEdgeNone;
    config.AnimatedTransitioningObj = obj;
    
    /*===========================================导航栏配置示例===========================================*/
    config.navColor = hexColor(isExistKeyValue(themeConfigDict,@"navColor") ? [[themeConfigDict objectForKey:@"navColor"] longValue]: -1);
    config.barStyle = UIBarStyleBlack;//UIBarStyleDefault
    config.navLineColor = hexColor(isExistKeyValue(themeConfigDict,@"navLineColor") ? [[themeConfigDict objectForKey:@"navLineColor"] longValue]: -1);
    config.navText = isExistKeyValue(themeConfigDict,@"navText") ? [themeConfigDict objectForKey:@"navText"] : @"统一认证登录";
    config.navTextSize = isExistKeyValue(themeConfigDict,@"navTextSize") ? [[themeConfigDict objectForKey:@"navTextSize"] intValue] : 18;
    config.navTextColor = hexColor(isExistKeyValue(themeConfigDict,@"navTextColor") ? [[themeConfigDict objectForKey:@"navTextColor"] longValue]: -1);
    NSString * navGoBackImg_normal = isExistKeyValue(themeConfigDict,@"navGoBackImg_normal") ? [themeConfigDict objectForKey:@"navGoBackImg_normal"] : @"cmcc_return_bg";
    config.navGoBackImg_normal = [UIImage imageNamed:navGoBackImg_normal];
    NSString * navGoBackImg_highlighted = isExistKeyValue(themeConfigDict,@"navGoBackImg_highlighted") ? [themeConfigDict objectForKey:@"navGoBackImg_highlighted"] : @"cmcc_return_bg";
    config.navGoBackImg_highlighted = [UIImage imageNamed:navGoBackImg_highlighted];

    
    /*===========================================logo配置示例===========================================*/
    NSString * logoImgPath = isExistKeyValue(themeConfigDict,@"logoImg") ? [themeConfigDict objectForKey:@"logoImg"] : @"cmcc_login_logo";
    config.logoImg = [UIImage imageNamed:logoImgPath];
    config.logoOffsetY = isExistKeyValue(themeConfigDict,@"logoOffsetY") ? [[themeConfigDict objectForKey:@"logoOffsetY"] doubleValue] : 100;
    config.logoHidden = isExistKeyValue(themeConfigDict,@"logoHidden") ? [[themeConfigDict objectForKey:@"logoHidden"] boolValue] : YES;
    config.logoWidth = isExistKeyValue(themeConfigDict,@"logoWidth")  ? [[themeConfigDict objectForKey:@"logoWidth"] intValue]: 180;
    config.logoHeight = isExistKeyValue(themeConfigDict,@"logoHeight")  ? [[themeConfigDict objectForKey:@"logoHeight"] intValue]: 70;
    
    /*===========================================手机号标签配置示例========================================*/
    config.numberColor = hexColor(isExistKeyValue(themeConfigDict,@"numberColor") ? [[themeConfigDict objectForKey:@"numberColor"] longValue]:  -108766);
    config.numberTextSize = isExistKeyValue(themeConfigDict,@"numberTextSize") ? [[themeConfigDict objectForKey:@"numberTextSize"] intValue] : 30;
    config.numFieldOffsetY = isExistKeyValue(themeConfigDict,@"numFieldOffsetY") ? [[themeConfigDict objectForKey:@"numFieldOffsetY"] doubleValue] : 100;
               

    /*===========================================中部小logo及标签配置示例======================================*/
    config.brandLabelOffsetY = isExistKeyValue(themeConfigDict,@"brandLabelOffsetY") ? [[themeConfigDict objectForKey:@"brandLabelOffsetY"] doubleValue] : 250;
    config.brandLabelTextColor = hexColor(isExistKeyValue(themeConfigDict,@"brandLabelTextColor") ? [[themeConfigDict objectForKey:@"brandLabelTextColor"] longValue]:  -108766);
    config.brandLabelTextSize = isExistKeyValue(themeConfigDict,@"brandLabelTextSize") ? [[themeConfigDict objectForKey:@"brandLabelTextSize"] intValue] : 10;
    
    /*===========================================登录按钮配置示例=============================================*/
    config.logBtnText = isExistKeyValue(themeConfigDict,@"logBtnText") ? [themeConfigDict objectForKey:@"logBtnText"] : @"本机号码一键登录";
    config.logBtnOffsetY = isExistKeyValue(themeConfigDict,@"logBtnOffsetY") ? [[themeConfigDict objectForKey:@"logBtnOffsetY"] doubleValue] : 120;
    config.logBtnTextColor = hexColor(isExistKeyValue(themeConfigDict,@"logBtnTextColor") ? [[themeConfigDict objectForKey:@"logBtnTextColor"] longValue]:  -108766);
    config.logBtnWidth = isExistKeyValue(themeConfigDict,@"logBtnWidth") ? [[themeConfigDict objectForKey:@"logBtnWidth"] intValue] : 20;
    config.logBtnHeight = isExistKeyValue(themeConfigDict,@"logBtnHeight") ? [[themeConfigDict objectForKey:@"logBtnHeight"] intValue] : 30;
    config.logBtnTextSize = isExistKeyValue(themeConfigDict,@"logBtnTextSize") ? [[themeConfigDict objectForKey:@"logBtnTextSize"] intValue] : 12;
    //    config.logBtnBackground = EACCOUNT_LOGINBUTTON_BACKGROUND_COLOR;
    config.logBtnBackground = EACCOUNT_LOGINBUTTON_BACKGROUND_IMAGES;
    config.logBtnCornerRadius = isExistKeyValue(themeConfigDict,@"logBtnCornerRadius") ? [[themeConfigDict objectForKey:@"logBtnCornerRadius"] intValue] : 10;
    //    config.logBtnBgColor_normal = [UIColor redColor];
    //    config.logBtnBgColor_disable = [UIColor greenColor];
    //    config.logBtnBgColor_highlighted = [UIColor blueColor];
    //    //@[激活状态的图片,失效状态的图片,高亮状态的图片]
    //    UIImage *buttongImage1 = [self readImageByNameFromBundle:@"189m"];
    //    UIImage *buttongImage2 = [self readImageByNameFromBundle:@"test2"];
    //    UIImage *buttongImage3 = [self readImageByNameFromBundle:@"btn-close"];
    //    NSArray *btnImgs = [NSArray arrayWithObjects:buttongImage1,buttongImage2,buttongImage3, nil];
    //    config.logBtnImgs = btnImgs;
    //    config.loadingImg = [self readImageByNameFromBundle:@"logo_mini"];

    NSString * logBtnImgPath = isExistKeyValue(themeConfigDict,@"logBtnImgPath") ? [themeConfigDict objectForKey:@"logBtnImgPath"] : @"cmcc_login_btn_bg";
    UIImage *logBtnNormal = [UIImage imageNamed: [NSString stringWithFormat:@"%@%s", logBtnImgPath, "_normal"] ];
    UIImage *logBtnInvalied = [UIImage imageNamed: [NSString stringWithFormat:@"%@%s", logBtnImgPath, "_unable"] ];
    UIImage *logBtnHighted = [UIImage imageNamed: [NSString stringWithFormat:@"%@%s", logBtnImgPath, "_press"] ];
    config.logBtnImgs = @[logBtnNormal,logBtnInvalied,logBtnHighted];
    
    /*============================================其他登录方式按钮配置示例=========================================*/
    config.otherWayLogBtnText = isExistKeyValue(themeConfigDict,@"otherWayLogBtnText") ? [themeConfigDict objectForKey:@"otherWayLogBtnText"] : @"其他登录方式";
    config.otherWayLogBtnOffsetY = isExistKeyValue(themeConfigDict,@"otherWayLogBtnOffsetY") ? [[themeConfigDict objectForKey:@"otherWayLogBtnOffsetY"] intValue] : 150;
    config.otherWayLogBtnTextColor_normal = hexColor(isExistKeyValue(themeConfigDict,@"otherWayLogBtnTextColor_normal") ? [[themeConfigDict objectForKey:@"otherWayLogBtnTextColor_normal"] longValue]:  -108766);
    config.otherWayLogBtnTextColor_highlighted = hexColor(isExistKeyValue(themeConfigDict,@"otherWayLogBtnTextColor_highlighted") ? [[themeConfigDict objectForKey:@"otherWayLogBtnTextColor_highlighted"] longValue]:  -108766);
    config.otherWayLogBtnTextSize = isExistKeyValue(themeConfigDict,@"otherWayLogBtnTextSize") ? [[themeConfigDict objectForKey:@"otherWayLogBtnTextSize"] intValue] : 22;
    config.otherWayLogBtnHidden = isExistKeyValue(themeConfigDict,@"otherWayLogBtnHidden") ? [[themeConfigDict objectForKey:@"otherWayLogBtnHidden"] boolValue] : YES;
    
    
    /*=============================================勾选按钮 配置示例=============================================*/
    bool checkState = isExistKeyValue(themeConfigDict,@"checkState") ? [[themeConfigDict objectForKey:@"checkState"] boolValue] : NO;
    config.checkState = checkState ? EACCOUNT_CHECKSTATE_CHECKED : EACCOUNT_CHECKSTATE_UNCHECKED;
    NSString * uncheckedImgPath = isExistKeyValue(themeConfigDict,@"checkBtnImg_unchecked") ? [themeConfigDict objectForKey:@"checkBtnImg_unchecked"] : @"cmcc_uncheck_image";
    config.checkBtnImg_unchecked = [UIImage imageNamed:uncheckedImgPath];
    NSString * checkedImgPath = isExistKeyValue(themeConfigDict,@"checkBtnImg_checked") ? [themeConfigDict objectForKey:@"checkBtnImg_checked"] : @"cmcc_check_image";
    config.checkBtnImg_checked = [UIImage imageNamed:checkedImgPath];

    
    config.PALabelText = @"登录即同意《天翼账号服务与隐私协议》并授权[中央美术学院]获本机号码";
    config.EAStartIndex = 5;
    config.EAEndIndex = 17;
    config.PALabelOtherTextColor = hexColor(isExistKeyValue(themeConfigDict,@"appPrivacyTextColor") ? [[themeConfigDict objectForKey:@"appPrivacyTextColor"] longValue]:  -108766);
    config.PANameColor = hexColor(isExistKeyValue(themeConfigDict,@"appPrivacyAgreeColor") ? [[themeConfigDict objectForKey:@"appPrivacyAgreeColor"] longValue]:  -108766);
    //config.webNavText = @"服务与隐私协议";
    //config.PAUrl = @"";
    //config.pWebNavText = @"";
    
    config.PALabelTextSize = isExistKeyValue(themeConfigDict,@"appPrivacyTextSize") ? [[themeConfigDict objectForKey:@"appPrivacyTextSize"] intValue] : 10;
    config.PALabelTextLineSpacing = 4;
    config.checkBtnOffsetY = isExistKeyValue(themeConfigDict,@"privacyOffsetY") ? [[themeConfigDict objectForKey:@"privacyOffsetY"] intValue] : 50;
    config.PALabelOffsetY = isExistKeyValue(themeConfigDict,@"privacyOffsetY") ? [[themeConfigDict objectForKey:@"privacyOffsetY"] intValue] : 50;
    
    
    return config;
}


#pragma mark --------------显示获取token------------------
+ (void) displayLogin:(UIViewController *)vc modeParam:(NSDictionary*)modeParam result:(FlutterResult)result {
    _viewController = vc;

    NSString * appId = [modeParam objectForKey:@"appid"];
    NSString * appKey = [modeParam objectForKey:@"appkey"];
    
    NSDictionary * cmccThemeConfig = [modeParam objectForKey:@"cmccThemeConfig"];
    NSDictionary * cuccThemeConfig = [modeParam objectForKey:@"cuccThemeConfig"];
    NSDictionary * ctccThemeConfig = [modeParam objectForKey:@"ctccThemeConfig"];

    YMCustomConfig *config = [YMCustomConfig new];
    if(nil != cmccThemeConfig && ![cmccThemeConfig isKindOfClass:[NSNull class]]){
        config.cmccModel = [self createCMCCModel:cmccThemeConfig];
    }
    if(nil != cuccThemeConfig && ![cuccThemeConfig isKindOfClass:[NSNull class]]){
        config.cuccModel = [self createCUCCModel:cuccThemeConfig];
    }
    if(nil != ctccThemeConfig && ![ctccThemeConfig isKindOfClass:[NSNull class]]){
        config.ctccModel = [self createCTCCModel:ctccThemeConfig];
    }
    config.ctccMini = @NO;
    
    

    NSMutableDictionary * resultDict = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                        @"",@"retCode",
                                        @"",@"retMsg",nil];
    

    [[UniLogin shareInstance] loginWithViewControler:_viewController customConfig:config appId:appId secretKey:appKey complete:^(NSString * _Nullable mobile, NSString * _Nullable msg) {
        if (mobile) {
            NSLog(@"登录成功");
            [resultDict setValue:@"0000" forKey:@"retCode"];
            [resultDict setValue:mobile forKey:@"retMsg"];
        }else {
            NSLog(@"登录失败");
            if([@"CANCLE_LOGIN" isEqual:msg]){
                [resultDict setValue:@"1001" forKey:@"retCode"];
            }else{
                [resultDict setValue:@"1002" forKey:@"retCode"];
            }
                        
            [resultDict setValue:msg forKey:@"retMsg"];
        }
        [[UniLogin shareInstance] closeUniLoginViewControlerAnimated:NO completion:nil];

        result(resultDict);
    }];

}

@end
