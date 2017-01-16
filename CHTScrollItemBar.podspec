Pod::Spec.new do |s|
  s.name     = 'CHTScrollItemBar' 
  s.version  = '0.0.1' 
  s.license  = "MIT"  
  s.summary  = '上下联动的scrollView，用于多个界面的展示 ' 
  s.homepage = 'https://github.com/ChanRoy/CHTScrollItemBar' 
  s.author   = { 'ChanRoy' => 'chen_ht89@163.com' } 
  s.source   = { :git => 'https://github.com/ChanRoy/CHTScrollItemBar.git', :tag => "0.0.1"} //git路径、指定tag号
  s.platform = :ios, "7.0" 
  s.source_files = 'CHTScrollItemBar/CHTScrollItemBar*.{h,m}'  //库的源代码文件
  s.framework = 'UIKit',"Foundation"  //依赖的framework
  s.requires_arc = true
end
