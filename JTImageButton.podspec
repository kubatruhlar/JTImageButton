Pod::Spec.new do |s|
  s.name         = "JTImageButton"
  s.version      = "1.0.3"
  s.summary      = "JTImageButton is a UIButton subclass that makes TITLE+IMAGE work easier."

  s.description  = <<-DESC
                   **JTImageButton** is a UIButton subclass that makes TITLE+IMAGE work easier. Your image and title together WILL BE centered horizontally. You will be also able to resize provided image and change it’s color easier, so basically all you have to provide is a text as a title and image (*NO MORE* image asset editing to get an image that you want in a button).
                   DESC

  s.homepage     = "https://github.com/kubatruhlar/JTImageButton"
  s.screenshots  = "https://raw.githubusercontent.com/kubatruhlar/JTImageButton/master/Screens/img_example.png"

  s.license      = { :type => "MIT", :file => "LICENSE.md" }
  s.author    = "Jakub Truhlar"
  s.social_media_url   = "http://kubatruhlar.cz"
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/kubatruhlar/JTImageButton.git", :tag => "1.0.3" }
  s.source_files  = "JTImageButton/*"
  s.framework  = "UIKit"
  s.requires_arc = true
end
