#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint flutter_emay_login.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'flutter_emay_login'
  s.version          = '0.0.1'
  s.summary          = 'A new Flutter plugin.'
  s.description      = <<-DESC
A new Flutter plugin.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*','SDK/**/*.framework/Headers/{*.h}'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'

  s.ios.deployment_target = '11.0'
  s.ios.vendored_frameworks = 'SDK/UniLogin/UniLogin.framework','SDK/ThirdPartyLibs/chinaunicom/OAuth.framework','SDK/ThirdPartyLibs/cmcc/TYRZSDK.framework','SDK/ThirdPartyLibs/chinaTelecom/EAccountHYSDK.framework'
  s.resources = "SDK/ThirdPartyLibs/chinaTelecom/*.bundle","SDK/ThirdPartyLibs/cmcc/*.bundle"
  s.ios.libraries = 'c++.1','z'

  s.prefix_header_contents = '#import <flutter_emay_login/FlutterEmayLoginPlugin.h>'

  s.static_framework = true
end
