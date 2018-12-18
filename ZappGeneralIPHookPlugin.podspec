Pod::Spec.new do |s|
  s.name             = "ZappGeneralIPHookPlugin"
  s.version           = '0.0.1'
  s.summary          = "Zapp General IP Hook Plugin"
  s.description      = <<-DESC
                        ZappGeneralIPHookPlugin is a plugin that on launch check for validation via ip address.
                       DESC
  s.homepage         = "https://github.com/applicaster/ZappGeneralIPHookPlugin-iOS"
  s.license          = ''
  s.author           = { "cmps" => "a=y.bochman@applicaster.com" }
  s.source           = { :git => "git@github.com:applicaster/ZappGeneralIPHookPlugin-iOS.git", :tag => s.version.to_s }

  s.platform                = :ios, '9.0'
  s.ios.deployment_target   = "9.0"
  s.requires_arc            = true
  s.static_framework        = true
  s.swift_version           = '4.2'

  s.source_files  = 'PluginClasses/**/*.{swift}'
  s.resources     = 'PluginClasses/**/*.xib'

  s.xcconfig =  { 'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES',
                  'ENABLE_BITCODE' => 'YES',
                  'SWIFT_VERSION' => '4.2'
              }

  s.dependency 'ZappGeneralPluginsSDK'
end
