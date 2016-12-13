Pod::Spec.new do |s|
  s.name         = "DFCountDownButton"
  s.version      = '1.0.0'
  s.summary      = "DFCountDownButton, subclassing UIButton implementation iOS countdown button, register with sending the verification code and countdown"

  s.homepage     = "https://github.com/dingfude2008/DFCountDownButton"
  s.license      = "MIT"

  s.author       = { "dingfude2008" => "dingfude@qq.com" }
  s.source       = { :git => "https://github.com/dingfude2008/DFCountDownButton.git", :tag => s.version.to_s }
  s.source_files = 'DFCountDownButton/DFCountDownButton/DFCountDownButton/*.{h,m}'    
  s.platform     = :ios, '7.0'
  s.framework    = 'Foundation'
end
