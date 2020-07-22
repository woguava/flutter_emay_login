package cn.openunion.flutter_emay_login;

import android.content.pm.PackageManager;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** FlutterEmayLoginPlugin */
public class FlutterEmayLoginPlugin implements MethodCallHandler{
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;
  private  Registrar registrar;
  private  MobileAuth mobileAuth;
  private final  PermissionManager permissionManager;

  private FlutterEmayLoginPlugin(Registrar registrar){
    this.registrar = registrar;
    this.mobileAuth = new MobileAuth(registrar.activity());
    this.permissionManager = new PermissionManager(registrar.activity());
    registrar.addRequestPermissionsResultListener(permissionManager);
  }

  // This static function is optional and equivalent to onAttachedToEngine. It supports the old
  // pre-Flutter-1.12 Android projects. You are encouraged to continue supporting
  // plugin registration via this function while apps migrate to use the new Android APIs
  // post-flutter-1.12 via https://flutter.dev/go/android-project-migration.
  //
  // It is encouraged to share logic between onAttachedToEngine and registerWith to keep
  // them functionally equivalent. Only one of onAttachedToEngine or registerWith will be called
  // depending on the user's project. onAttachedToEngine or registerWith must both be defined
  // in the same class.
  public static void registerWith(Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "flutter_emay_login");
    channel.setMethodCallHandler(new FlutterEmayLoginPlugin(registrar));
  }

  @Override
  public void onMethodCall(MethodCall call, Result result) {
    //检验权限
    if( !permissionManager.requestPermission() ){
      result.error("mobileauth","check permission fail",null);
      return;
    }

    if (call.method.equals("getPlatformVersion")) {
      result.success("Android " + android.os.Build.VERSION.RELEASE);
    } else if (call.method.equals("displayLogin")) {
      mobileAuth = new MobileAuth(registrar.activity());
      mobileAuth.displayLogin(call,result);
    }else {
      result.notImplemented();
    }
  }

}
