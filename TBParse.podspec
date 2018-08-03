#
# Be sure to run `pod lib lint TBParse.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = 'TBParse'
    s.version          = '1.2.0'
    s.summary          = 'A basic conversions for PFObject and Parse strings columns to lists of numbers, strings or key: value pairs.'
    
    # This description is used to generate tags and improve search results.
    #   * Think: What does it do? Why did you write it? What is the focus?
    #   * Try to keep it short, snappy and to the point.
    #   * Write the description between the DESC delimiters below.
    #   * Finally, don't worry about the indent, CocoaPods strips it!
    
    s.description      = <<-DESC
    A basic conversions for PFObject and Parse strings columns to lists of numbers, strings or key: value pairs. This methods allow to enhance parse server capabilities.
    DESC
    
    s.homepage         = 'https://github.com/truebucha/TBParse'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'truebucha' => 'truebucha@gmail.com' }
    s.source           = { :git => 'https://github.com/truebucha/TBParse.git', :tag => s.version.to_s }
    s.social_media_url = 'https://twitter.com/truebucha'
    
    s.module_name   = 'TBParse'
    s.ios.deployment_target = '9.0'
    s.osx.deployment_target = '10.10'
    
    s.default_subspecs = 'Core'
    
    s.subspec 'Core' do |sp|
        sp.source_files = 'TBParse/Classes/Core/*'
        sp.public_header_files = 'TBParse/Classes/Core/*.h'
        sp.dependency 'TBConversions/Parse'
        sp.dependency 'Parse'
    end
    
    s.frameworks = 'Foundation'
end
