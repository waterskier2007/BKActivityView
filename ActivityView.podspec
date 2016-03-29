Pod::Spec.new do |s|

    s.platform = :ios
    s.ios.deployment_target = '8.0'
    s.name = "ActivityView"
    s.summary = "A good looking activity indicator."
    s.requires_arc = true

    s.version = "0.1.0"

    s.license = { :type => "MIT", :file => "LICENSE" }

    s.author = { "Joshua Greene" => "jrg.developer@gmail.com" }

    s.homepage = "https://github.com/JRG-Developer/RWPickFlavor"

    s.source = { :git => "https://github.com/waterskier2007/BKActivityView", :tag => "#{s.version}"}

    s.framework = "UIKit"

    s.source_files = "RWPickFlavor/**/*.{swift}"

    # s.resources = "ActivityView/**/*.{png,jpeg,jpg,storyboard,xib}"

end