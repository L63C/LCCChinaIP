#
# Be sure to run `pod lib lint LCCChinaIP.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LCCChinaIP'
  s.version          = '0.1.0'
  s.summary          = '判断是否是中国IP地址'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  判断是否是中国IP地址，自动获取手机的外网IP 地址
                       DESC

  s.homepage         = 'https://github.com/L63C/LCCChinaIP'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'lu63chuan@163.com' => 'lu63chuan@163.com' }
  s.source           = { :git => 'https://github.com/L63C/LCCChinaIP.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'LCCChinaIP/Classes/**/*'
  
  s.resource_bundles = {
    'LCCChinaIP' => ['LCCChinaIP/Assets/*']
  }
  #s.resource = ['LCCChinaIP/Assets/*']
  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
