
Pod::Spec.new do |s|
  s.name             = 'FusePopup'
  s.version          = '1.1.0'
  s.summary          = 'A flexible chain-style popup manager for iOS.'

  s.description      = <<-DESC
  FusePopup is a lightweight, chain-style popup management framework for iOS.
  It supports custom popup conditions, lifecycle binding, and multiple presentation strategies.
  DESC

  s.homepage         = 'https://github.com/snail-z/FusePopup'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'snail-z' => 'haozhang0770@163.com' }
  
  s.swift_versions = ['5.0']
  s.ios.deployment_target = '13.0'
    
  s.source           = { :git => 'https://github.com/snail-z/FusePopup.git', :tag => s.version.to_s }

  s.source_files  = ["Sources/**/*.swift"]
  s.resource_bundles = { 'FusePopup' => ['Sources/PrivacyInfo.xcprivacy'] }
  s.pod_target_xcconfig = { 'BUILD_LIBRARY_FOR_DISTRIBUTION' => 'YES' }
  s.requires_arc = true
end
