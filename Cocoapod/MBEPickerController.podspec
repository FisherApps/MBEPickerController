Pod::Spec.new do |s|
  s.name         = "MBEPickerController"
  s.version      = "0.0.1"
  s.summary      = "Text / Date / Time / DateTime PickerController"
  s.homepage     = "https://github.com/mevansjr/MBEPickerController"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Mark Evans" => "mevansjr@gmail.com" }
  s.platform     = :ios
  s.source       = { :git => "https://github.com/mevansjr/MBEPickerController.git", :commit => "9e182c45f2bf35e1e22947e82687b5082bbdea26" }
  s.source_files = 'Classes/*.{h,m}'
  s.requires_arc = true
end
