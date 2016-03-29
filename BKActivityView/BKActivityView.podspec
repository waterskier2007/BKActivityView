Pod::Spec.new do |s|

    s.platform = :ios
    s.ios.deployment_target = '8.0'
    s.name = "BKActivityView"
    s.summary = "A good looking loading indicator"
    s.requires_arc = true

    s.version = "0.1.0"

s.license = { :type => "MIT", :file => "LICENSE" }

    s.author = { "Brendan Kirchner" => "brendankirchner@me.com" }

    s.homepage = "https://github.com/waterskier2007/BKActivityView"

    s.source = { :git => "https://github.com/waterskier2007/BKActivityView.git", :tag => "#{s.version}" }

    s.framework = "UIKit"

    s.source_files = "BKActivityView/**/*.{swift}"

end
