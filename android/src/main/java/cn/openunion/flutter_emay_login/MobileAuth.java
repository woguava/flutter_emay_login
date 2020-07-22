package cn.openunion.flutter_emay_login;

import android.app.Activity;
import android.util.Log;
import android.widget.Toast;

import java.util.HashMap;
import java.util.Map;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

import cn.com.chinatelecom.account.sdk.AuthPageConfig;
import cn.emay.ql.LoginCallback;
import cn.emay.ql.UniSDK;
import cn.emay.ql.utils.DeviceUtil;
import cn.emay.ql.utils.LoginUiConfig;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.JSONException;

public class MobileAuth {
    private final Activity flutter_activity;

    public MobileAuth(Activity activity){
        this.flutter_activity = activity;
    }

    public void displayLogin(final MethodCall call,final MethodChannel.Result result){
        String appKey = call.argument("appkey");
        String appId = call.argument("appid") ;

        UniSDK.getInstance().login(flutter_activity,appId,appKey,new LoginCallback(){
            @Override
            public void onSuccess(final String msg) {
                flutter_activity.runOnUiThread(new Runnable() {
                    @Override
                    public void run() {
                        Map<String,String> resultMap = new HashMap<String,String>();
                        resultMap.put("retCode","0000");
                        resultMap.put("retMsg",msg);
                        result.success(resultMap);
                    }
                });
            }

            @Override
            public void onFailed(final String msg) {
                flutter_activity.runOnUiThread(new Runnable() {
                    @Override
                    public void run() {
                        Map<String,String> resultMap = new HashMap<String,String>();
                        if(msg.equals("用户取消登录")){
                            resultMap.put("retCode","1001");
                        }else{
                            resultMap.put("retCode","1002");
                            try {
                                JSONObject jsonObj = JSONObject.parseObject(msg);
                                if (null != jsonObj && null != jsonObj.get("result")) {
                                    int ctccRet = jsonObj.getIntValue("result");
                                    if (ctccRet == 80200) {
                                        resultMap.put("retCode", "1001");
                                    }
                                }
                            }catch (JSONException e){

                            }
                        }
                        resultMap.put("retMsg",msg);
                        result.success(resultMap);
                        //Toast.makeText(flutter_activity,"登录失败" + msg,Toast.LENGTH_SHORT).show();
                    }
                });
            }
        },getLoginUiConfig(call),false);

    }

    private LoginUiConfig getLoginUiConfig(final MethodCall call){
        LoginUiConfig uiConfig = new LoginUiConfig();

        if(call.hasArgument("cmccThemeConfig") && null != call.argument("cmccThemeConfig")) {
            HashMap<String, Object> cmccThemeConfig = call.argument("cmccThemeConfig");

            Log.d("移动配置：", cmccThemeConfig.toString());

            LoginUiConfig.YiDongLoginConfig yidongConfig = uiConfig.new YiDongLoginConfig();

            ///授权页导航栏
            Number statusBarColor = 0xff0086d0;
            if (null != cmccThemeConfig.get("statusBarColor")) {
                statusBarColor = (Number) cmccThemeConfig.get("statusBarColor");
            }
            yidongConfig.setStatusBarColor(statusBarColor.intValue());

            boolean authNavTransparent = false;
            if (null != cmccThemeConfig.get("authNavTransparent")) {
                authNavTransparent = (boolean) cmccThemeConfig.get("authNavTransparent");
            }
            yidongConfig.setAuthNavTransparent(authNavTransparent);//授权页head是否隐藏

            String authBGImgPath = "";
            if (null != cmccThemeConfig.get("authBGImgPath")) {
                authBGImgPath = (String) cmccThemeConfig.get("authBGImgPath");
            }
            yidongConfig.setAuthBGImgPath(authBGImgPath);//设置背景图

            Number navColor = 0xff0086d0;
            if (null != cmccThemeConfig.get("navColor")) {
                navColor = (Number) cmccThemeConfig.get("navColor");
            }
            yidongConfig.setNavColor(navColor.intValue());//导航栏颜色

            String navReturnImgPath = "";
            if (null != cmccThemeConfig.get("navReturnImgPath")) {
                navReturnImgPath = (String) cmccThemeConfig.get("navReturnImgPath");
            }
            yidongConfig.setNavReturnImgPath(navReturnImgPath);//导航返回图标

            int navReturnImgSize = 30;
            if (null != cmccThemeConfig.get("navReturnImgSize")) {
                navReturnImgSize = (int) cmccThemeConfig.get("navReturnImgSize");
            }
            yidongConfig.setNavReturnSize(navReturnImgSize);//返回图标大小

            yidongConfig.setNavText((String) cmccThemeConfig.get("navText"));//导航栏标题
            Number navTextColor = 0xffffffff;
            if (null != cmccThemeConfig.get("navTextColor")) {
                navTextColor = (Number) cmccThemeConfig.get("navTextColor");
            }
            yidongConfig.setNavTextColor(navTextColor.intValue());//导航栏字体颜色
            int navTextSize = 30;
            if (null != cmccThemeConfig.get("navTextSize")) {
                navTextSize = (int) cmccThemeConfig.get("navTextSize");
            }
            yidongConfig.setNavTextSize(navTextSize);

            yidongConfig.setLoginLogo((String) cmccThemeConfig.get("logoImgPath"));//logo图片
            int logoWidth = 70;
            if (null != cmccThemeConfig.get("logoWidth")) {
                logoWidth = (int) cmccThemeConfig.get("logoWidth");
            }
            yidongConfig.setLogoWidthDip(logoWidth);//图片宽度
            int logoHeight = 70;
            if (null != cmccThemeConfig.get("logoHeight")) {
                logoHeight = (int) cmccThemeConfig.get("logoHeight");
            }
            yidongConfig.setLogoHeightDip(logoHeight);//图片高度
            int logoOffsetY = 100;
            if (null != cmccThemeConfig.get("logoOffsetY")) {
                logoOffsetY = (int) cmccThemeConfig.get("logoOffsetY");
            }
            yidongConfig.setLogoOffsetY(logoOffsetY);//图片Y偏移量
            boolean logoHidden = false;
            if (null != cmccThemeConfig.get("logoHidden")) {
                logoHidden = (boolean) cmccThemeConfig.get("logoHidden");
            }
            yidongConfig.setLogoHidden(logoHidden);//logo图片隐藏

            Number numberColor = 0xff333333;
            if (null != cmccThemeConfig.get("numberColor")) {
                numberColor = (Number) cmccThemeConfig.get("numberColor");
            }
            yidongConfig.setNumberColor(numberColor.intValue());//手机号码字体颜色
            int numberSize = 18;
            if (null != cmccThemeConfig.get("numberSize")) {
                numberSize = (int) cmccThemeConfig.get("numberSize");
            }
            yidongConfig.setNumberSize(numberSize);////手机号码字体大小
            int numberOffsetY = 170;
            if (null != cmccThemeConfig.get("numberOffsetY")) {
                numberOffsetY = (int) cmccThemeConfig.get("numberOffsetY");
            }
            yidongConfig.setNumFieldOffsetY(numberOffsetY);//号码栏Y偏移量

            Number sloganTextColor = 0xff999999;
            if (null != cmccThemeConfig.get("sloganTextColor")) {
                sloganTextColor = (Number) cmccThemeConfig.get("sloganTextColor");
            }
            yidongConfig.setSloganTextColor(sloganTextColor.intValue());//slogan文字颜色
            int sloganTextSize = 10;
            if (null != cmccThemeConfig.get("sloganTextSize")) {
                sloganTextSize = (int) cmccThemeConfig.get("sloganTextSize");
            }
            yidongConfig.setSloganTextSize(sloganTextSize);//slogan文字大小
            int sloganOffsetY = 230;
            if (null != cmccThemeConfig.get("sloganOffsetY")) {
                sloganOffsetY = (int) cmccThemeConfig.get("sloganOffsetY");
            }
            yidongConfig.setSloganOffsetY(sloganOffsetY);//slogan声明标语Y偏移量

            yidongConfig.setLogBtnText(cmccThemeConfig.get("logBtnText").toString());//登录按钮文本
            Number logBtnTextColor = 0xffffffff;
            if (null != cmccThemeConfig.get("logBtnTextColor")) {
                logBtnTextColor = (Number) cmccThemeConfig.get("logBtnTextColor");
            }
            yidongConfig.setLogBtnTextColor(logBtnTextColor.intValue());//登录按钮文本颜色
            yidongConfig.setLogBtnImgPath(cmccThemeConfig.get("logBtnImgPath").toString());//登录按钮背景
            int logBtnSize = 15;
            if (null != cmccThemeConfig.get("logBtnSize")) {
                logBtnSize = (int) cmccThemeConfig.get("logBtnSize");
            }
            yidongConfig.setLogBtnSize(logBtnSize);
            int logBtnOffsetY = 254;
            if (null != cmccThemeConfig.get("logBtnOffsetY")) {
                logBtnOffsetY = (int) cmccThemeConfig.get("logBtnOffsetY");
            }
            yidongConfig.setLogBtnOffsetY(logBtnOffsetY);//登录按钮Y偏移量

            Number switchAccTextColor = 0xff329af3;
            if (null != cmccThemeConfig.get("switchAccTextColor")) {
                switchAccTextColor = (Number) cmccThemeConfig.get("switchAccTextColor");
            }
            yidongConfig.setSwitchAccTextColor(switchAccTextColor.intValue());//切换账号字体颜色
            boolean switchAccHidden = true;
            if (null != cmccThemeConfig.get("switchAccHidden")) {
                switchAccHidden = (boolean) cmccThemeConfig.get("switchAccHidden");
            }
            yidongConfig.setShowOtherLogin(switchAccHidden);//切换账号是否隐藏
            int switchAccTextSize = 14;
            if (null != cmccThemeConfig.get("switchAccTextSize")) {
                switchAccTextSize = (int) cmccThemeConfig.get("switchAccTextSize");
            }
            yidongConfig.setSwitchAccTextSize(switchAccTextSize);//切换账号字体大小
            int switchOffsetY = 310;
            if (null != cmccThemeConfig.get("switchOffsetY")) {
                switchOffsetY = (int) cmccThemeConfig.get("switchOffsetY");
            }
            yidongConfig.setSwitchOffsetY(switchOffsetY);//切换账号偏移量

            yidongConfig.setUncheckedImgPath(cmccThemeConfig.get("uncheckedImgPath").toString());//chebox未被勾选图片
            yidongConfig.setCheckedImgPath(cmccThemeConfig.get("checkedImgPath").toString());//chebox被勾选图片
            int checkboxWH = 12;
            if (null != cmccThemeConfig.get("checkboxWH")) {
                checkboxWH = (int) cmccThemeConfig.get("checkboxWH");
            }
            yidongConfig.setCheckBoxImgPathSize(checkboxWH);//勾选check大小
            boolean privacyState = true;
            if (null != cmccThemeConfig.get("privacyState")) {
                privacyState = (boolean) cmccThemeConfig.get("privacyState");
            }
            yidongConfig.setPrivacyState(privacyState);//授权页check

            yidongConfig.setPrivacyAlignment1("登录即同意");
            if (null != cmccThemeConfig.get("clauseOneName") && null != cmccThemeConfig.get("clauseOneUrl")) {
                yidongConfig.setPrivacyAlignment2(cmccThemeConfig.get("clauseOneName").toString());
                yidongConfig.setPrivacyAlignment3(cmccThemeConfig.get("clauseOneUrl").toString());
            }

            if (null != cmccThemeConfig.get("clauseTwoName") && null != cmccThemeConfig.get("clauseTwoName")) {
                yidongConfig.setPrivacyAlignment4(cmccThemeConfig.get("clauseTwoName").toString());
                yidongConfig.setPrivacyAlignment5(cmccThemeConfig.get("clauseTwoUrl").toString());
            }
            yidongConfig.setPrivacyAlignment6("使用本机号码登录");
            int appPrivacyTextSize = 10;
            if(null != cmccThemeConfig.get("appPrivacyTextSize")){
                appPrivacyTextSize = (int) cmccThemeConfig.get("appPrivacyTextSize");
            }
            yidongConfig.setPrivacyTextSize(appPrivacyTextSize);
            Number appPrivacyTextColor = 0xff666666;
            if(null != cmccThemeConfig.get("appPrivacyTextColor")){
                appPrivacyTextColor = (Number)cmccThemeConfig.get("appPrivacyTextColor");
            }
            yidongConfig.setPrivacyTextColor1(appPrivacyTextColor.intValue());//文字颜色
            Number appPrivacyAgreeColor = 0xff0085d0;
            if(null != cmccThemeConfig.get("appPrivacyAgreeColor")){
                appPrivacyAgreeColor = (Number)cmccThemeConfig.get("appPrivacyAgreeColor");
            }
            yidongConfig.setPrivacyTextColor2(appPrivacyAgreeColor.intValue());//条款颜色
            int privacyOffsetY = 30;
            if(null != cmccThemeConfig.get("privacyOffsetY")){
                privacyOffsetY = (int) cmccThemeConfig.get("privacyOffsetY");
            }
            yidongConfig.setPrivacyOffsetY_B(privacyOffsetY);//隐私条款Y偏移量
            yidongConfig.setPrivacyMargin(20);
            uiConfig.setYiDongLoginConfig(yidongConfig);
        }

        if(call.hasArgument("cuccThemeConfig") && null != call.argument("cuccThemeConfig")){
            HashMap<String,Object> cuccThemeConfig = call.argument("cuccThemeConfig");
            Log.d("联通配置：",cuccThemeConfig.toString());

            LoginUiConfig.LianTongLoginConfig lianTongLoginConfig = uiConfig.new LianTongLoginConfig();

            boolean checkBoxHidden = false;
            if(null != cuccThemeConfig.get("checkBoxHidden")) {
                checkBoxHidden = (boolean) cuccThemeConfig.get("checkBoxHidden");
            }
            lianTongLoginConfig.setShowProtocolBox(checkBoxHidden);//不展示协议的勾选框
            //注意，当setShowProtocolBox = false时，只能通过代码来设置按钮文字
            lianTongLoginConfig.setLoginButtonText(cuccThemeConfig.get("logBtnText").toString());//按钮文字内容
            int logBtnLeading = 500;
            if(null != cuccThemeConfig.get("logBtnLeading")){
                logBtnLeading = (int) cuccThemeConfig.get("logBtnLeading");
            }
            lianTongLoginConfig.setLoginButtonWidth(logBtnLeading);//按钮宽度
            int logBtnHeight = 30;
            if(null != cuccThemeConfig.get("logBtnHeight")){
                logBtnHeight = (int) cuccThemeConfig.get("logBtnHeight");
            }
            lianTongLoginConfig.setLoginButtonHeight(logBtnHeight);//按钮高度
            int logBtnOffsetY = 100;
            if(null != cuccThemeConfig.get("logBtnOffsetY")){
                logBtnOffsetY = (int) cuccThemeConfig.get("logBtnOffsetY");
            }
            lianTongLoginConfig.setOffsetY(logBtnOffsetY);//按钮Y轴距离
            lianTongLoginConfig.setProtocolCheckRes(cn.emay.ql.R.drawable.selector_button_cucc);//按钮点击背景
            lianTongLoginConfig.setProtocolUnCheckRes(cn.emay.ql.R.drawable.selector_button_ctc);//按钮未点击背景

            if(null != cuccThemeConfig.get("appFPrivacyId") && null != cuccThemeConfig.get("appFPrivacyUrl")){
                lianTongLoginConfig.setProtocolID(cuccThemeConfig.get("appFPrivacyId").toString());//xml布局中定义的控件id
                lianTongLoginConfig.setProtocolUrl(cuccThemeConfig.get("appFPrivacyUrl").toString());
            }
            if(null != cuccThemeConfig.get("appSPrivacyId") && null != cuccThemeConfig.get("appSPrivacyUrl")){
                lianTongLoginConfig.setProtocolID1(cuccThemeConfig.get("appSPrivacyId").toString());//xml布局中定义的控件id
                lianTongLoginConfig.setProtocolUrl(cuccThemeConfig.get("appSPrivacyUrl").toString());
            }

            uiConfig.setLianTongLoginConfig(lianTongLoginConfig);
        }

        if(call.hasArgument("ctccThemeConfig") && null != call.argument("ctccThemeConfig")){
            HashMap<String,Object> ctccThemeConfig = call.argument("ctccThemeConfig");
            Log.d("电信配置：",ctccThemeConfig.toString());


            //隐私协议文本,其中配置说明如下
            // 1、$OAT 为运营商协议标题占位符，SDK程序默认替换为《天翼账号服务与隐私协议》，若有其它运营商协议配置需求，可添加配置；
            // 2、$CAT 为自定义协议标题占位符，SDK程序会替换为自定义标题字段的值；
            // 3、[应用名] ：修改为您应用的名称
//            String showPrivacyText = null;
//            showPrivacyText = String.format("");
            /*LoginUiConfig.DianXinLoginConfig dianXinLoginConfig = uiConfig.new DianXinLoginConfig();
            dianXinLoginConfig.setPrivacyText("登录即同意$OAT与$CAT并授权[本demo]获取本机号码");
            //Number ctccThemeConfig.get()
            dianXinLoginConfig.setPrivacyTextColor(0xFF000000);//隐私协议文本的字体颜色
            dianXinLoginConfig.setPrivacyTextSize(12);//隐私协议文本的字体大小
            dianXinLoginConfig.setOperatorAgreementTitleColor(0xFF0090FF);//运营商协议标题的字体颜色
            dianXinLoginConfig.setCustomAgreementTitle("《我的自定义协议》");//自定义协议标题
            dianXinLoginConfig.setCustomAgreementLink("https://www.baidu.com");//自定义协议wap页面地址
            dianXinLoginConfig.setCustomAgreementTitleColor(0xFF0090FF);//自定义协议标题的字体颜色

            //弹窗登录设置弹窗大小，单位为px
            dianXinLoginConfig.setDialogHeight(1000);
            dianXinLoginConfig.setDialogWidth(DeviceUtil.getScreenWidth(flutter_activity));
            //弹窗弹出位置AuthPageConfig.BOTTOM,AuthPageConfig.CENTER
            dianXinLoginConfig.setLocation(AuthPageConfig.BOTTOM);

            uiConfig.setDianXinLoginConfig(dianXinLoginConfig);*/
        }

        return uiConfig;
    }
}
