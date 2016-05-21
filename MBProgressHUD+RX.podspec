









Pod::Spec.new do |s|
  s.name     = "MBProgressHUD+RX"
  s.version  = "0.9.2.1"
  s.license  = "MIT"
  s.summary  = "MBProgressHUD+RX is a simple ext of MBProgressHUD"
  s.homepage = "https://github.com/xzjxylophone/MBProgress-RX"
  s.author   = { 'Rush.D.Xzj' => 'xzjxylophoe@gmail.com' }
  s.social_media_url = "http://weibo.com/xzjxylophone"
  s.source   = { :git => 'https://github.com/xzjxylophone/MBProgressHUD-RX.git', :tag => "v#{s.version}" }
  s.description = %{
    MBProgressHUD+RX is a simple ext of MBProgressHUD.
  }
  s.source_files = 'MBProgressHUD-RX/*.{h,m}'
  s.frameworks = 'Foundation', 'UIKit'
  s.requires_arc = true
  s.platform = :ios, '7.0'
  s.dependency 'MBProgressHUD'
end






