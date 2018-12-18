Pod::Spec.new do |s|
  s.name             = "BabyHookWebPlugin"
  s.version           = '0.0.1'
  s.summary          = "BabyHookWebPlugin"
  s.description      = <<-DESC
  "name": "Baby First Web hook plugin".
                       DESC
  s.homepage         = "https://github.com/applicaster/BabyHookWebPlugin-iOS"
  s.license          = ''
  s.author           = { "cmps" => "a=m.vecselboim@applicaster.com" }
  s.source           = { :git => "git@github.com:applicaster/BabyHookWebPlugin-iOS.git", :tag => s.version.to_s }

  s.platform                = :ios, '9.0'
  s.ios.deployment_target   = "9.0"
  s.requires_arc            = true
  s.static_framework        = true
  s.swift_version           = '4.2'

  s.source_files = 'PluginClasses/**/*.{swift}'

  s.xcconfig =  { 'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES',
                  'ENABLE_BITCODE' => 'YES',
                  'SWIFT_VERSION' => '4.2'
              }

  s.dependency 'ApplicasterSDK'
  s.dependency 'ComponentsSDK'
  s.dependency 'ZappGeneralPluginsSDK'
end
