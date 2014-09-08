Pod::Spec.new do |s|
  s.name         = "MBEPickerController"
  s.version      = "0.1"
  s.summary      = "A custom  UIPickerView and UIDatePicker with a simple list of options, along with options to Select/Cancel for iOS7 & iOS8."
  s.homepage     = "https://github.com/mevansjr/MBEPickerController"

  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { 'Mark Evans' => 'mark@3advance.com' }
  s.source       = {
    :git => "https://github.com/mevansjr/MBEPickerController.git",
    :tag => "#{s.version}"
  }

  s.platform     = :ios
  s.source_files = 'MBEPickerController/*.{h,m}'
  s.requires_arc = false
end
