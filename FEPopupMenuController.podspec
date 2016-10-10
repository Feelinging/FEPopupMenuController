#
#  Be sure to run `pod spec lint FEPopupMenuController.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "FEPopupMenuController"
  s.version      = "0.0.2"
  s.summary      = "A simple, elegant pop-up menu view."
  s.description  = <<-DESC
                    a easy to use,customization pop-up menu view.
                   DESC

  s.homepage     = "https://github.com/Feelinging/FEPopupMenuController"
  s.screenshots  = "https://raw.github.com/Feelinging/FEPopupMenuController/master/screenshot.png"


  s.license      = "MIT"
  s.author             = { "isaced" => "isaced@163.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/Feelinging/FEPopupMenuController.git", :tag => "0.0.2" }

  s.source_files  = "FEPopupMenuController", "FEPopupMenuController/**/*.{h,m}"
  s.resource_bundle = { "FEPopupResource" => "FEPopupMenuController/**/*.xib" }
  s.requires_arc = true

end
