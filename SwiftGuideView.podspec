
Pod::Spec.new do |s|
  s.name             = 'SwiftGuideView'
  s.version          = '0.8.1'
  s.summary          = 'A short description of SwiftGuideView.'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/jackiehu/SwiftGuideView'

  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'jackiehu' => 'jackie' }
  s.source           = { :git => 'https://github.com/jackiehu/SwiftGuideView.git', :tag => s.version.to_s }

  s.ios.deployment_target = '11.0'
  s.swift_versions     = ['5.0','5.1','5.2']
  s.source_files = 'Sources/**/*'
  s.requires_arc = true
  s.dependency 'SwiftPageView'
  s.dependency 'SnapKit' 
end
