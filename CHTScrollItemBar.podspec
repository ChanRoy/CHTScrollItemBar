Pod::Spec.new do |s|
s.name         = "CHTScrollItemBar"
s.version      = "0.0.1"
s.summary      = "上下联动的scrollView，用于多个界面的展示"
s.homepage     = "https://github.com/ChanRoy/CHTScrollItemBar"
s.license      = "MIT"
s.author             = { "ChanRoy" => "chen_ht89@163.com" }
s.social_media_url   = "https://github.com/ChanRoy"
s.platform     = :ios, "7.0"
s.source       = { :git => "https://github.com/ChanRoy/CHTScrollItemBar.git", :tag => s.version}
s.source_files  = "CHTScrollItemBar/**/*.{h,m}"
s.requires_arc = true

end
