#
#  Be sure to run `pod spec lint Seed.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  s.name         = "Seed"
  s.version      = "0.0.1"
  s.summary      = "A short description of Seed."

  s.description  = <<-DESC
                   A longer description of Seed in Markdown format.

                   * Think: Why did you write this? What is the focus? What does it do?
                   * CocoaPods will be using this to generate tags, and improve search results.
                   * Try to keep it short, snappy and to the point.
                   * Finally, don't worry about the indent, CocoaPods strips it!
                   DESC

  s.homepage     = "http://EXAMPLE/Seed"

  s.license      = "MIT"


  s.author             = { "Ryan Wang" => "wanglun02@gmail.com" }
  s.social_media_url   = "http://twitter.com/lunwang"


  s.platform     = :ios
  s.platform     = :ios, "7.0"


  s.source       = { :git => "https://github.com/aelam/SEED.git", :tag => "0.0.1" }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  CocoaPods is smart about how it includes source code. For source files
  #  giving a folder will include any swift, h, m, mm, c & cpp files.
  #  For header files it will include any header in the folder.
  #  Not including the public_header_files will make all headers public.
  #

  s.source_files  = "Seed/Core/", "Seed/**/*.{h,m}"
#  s.exclude_files = "Seed/Exclude"

  s.public_header_files = "Seed/**/*.h"


  s.requires_arc = true

  s.dependency "Nimbus/Models", "~> 1.2.0"
  s.dependency "Nimbus/Collections", "~> 1.2.0"

end
