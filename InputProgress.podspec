#
# Be sure to run `pod lib lint InputProgress.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'InputProgress'
  s.version          = '1.0.0'
  s.summary          = 'A progress bar for the keyboard and its presenting view.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
This library provides a way to give feedback to the user regarding his progress on an exaustive form flow. A customizable progress bar can be added both to the selected UITextFields as well as on the view they are being presented.
                       DESC

  s.homepage         = 'https://github.com/OpenCraft/InputProgress'
  s.screenshots     = 'https://media.giphy.com/media/26FfdDh1F3iwS4hLq/giphy.gif'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'rottajuliano' => 'juliano.rotta@gmail.com' }
  s.source           = { :git => 'https://github.com/OpenCraft/InputProgress.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'InputProgress/Classes/**/*'
  
  # s.resource_bundles = {
  #   'InputProgress' => ['InputProgress/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
