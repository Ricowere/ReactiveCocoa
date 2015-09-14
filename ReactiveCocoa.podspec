Pod::Spec.new do |s|
	s.name             = "ReactiveCocoa"
	s.version          = "3.0.0"
	s.summary          = "A framework for composing and transforming streams of values"
	s.description      = <<-DESC
					   ReactiveCocoa (RAC) is an Objective-C framework for Functional Reactive Programming. It provides APIs for composing and transforming streams of values.
					   DESC
	s.homepage         = "https://github.com/ReactiveCocoa/ReactiveCocoa"
	s.license          = 'MIT'
	s.author           = { "david.rico" => "drico.david@gmail.com" }
	s.source           = { :git => "https://github.com/ReactiveCocoa/ReactiveCocoa.git", :tag => "v" + s.version.to_s }

	s.platforms     = { :ios => '8.0', :osx => '10.10' }
	s.requires_arc = true

	s.default_subspec = 'UI'

	s.subspec 'Core' do |ss|
		ss.source_files = 'ReactiveCocoa/**/*.{d,h,m,swift}'
    ss.exclude_files = '**/ReactiveCocoa.h', 'ReactiveCocoa/**/*{RACObjCRuntime,AppKit,NSControl,NSText,NSTable,UIActionSheet,UIAlertView,UIBarButtonItem,UIButton,UICollectionReusableView,UIControl,UIDatePicker,UIGestureRecognizer,UIImagePicker,UIRefreshControl,UISegmentedControl,UISlider,UIStepper,UISwitch,UITableViewCell,UITableViewHeaderFooterView,UIText,MK}*' 

    ss.header_dir = 'ReactiveCocoa'
    ss.private_header_files = '**/*Private.h', '**/*EXTRuntimeExtensions.h', '**/RACEmpty*.h'

    ss.dependency 'ReactiveCocoa/no-arc'

    ss.frameworks = 'Foundation'
	end

  s.subspec 'no-arc' do |ss|
    ss.source_files = 'ReactiveCocoa/Objective-C/RACObjCRuntime.{h,m}'
    ss.requires_arc = false
    
    ss.frameworks = 'Foundation'
  end

  s.subspec 'UI' do |ss|
    
    ss.ios.source_files = '**/ReactiveCocoa.h', 'ReactiveCocoa/**/*{UIActionSheet,UIAlertView,UIBarButtonItem,UIButton,UICollectionReusableView,UIControl,UIDatePicker,UIGestureRecognizer,UIImagePicker,UIRefreshControl,UISegmentedControl,UISlider,UIStepper,UISwitch,UITableViewCell,UITableViewHeaderFooterView,UIText,MK}*'
    ss.osx.source_files = '**/ReactiveCocoa.h', 'ReactiveCocoa/**/*{AppKit,NSControl,NSText,NSTable}*'

    ss.dependency 'ReactiveCocoa/Core'

    ss.osx.frameworks = 'AppKit'
    ss.ios.frameworks = 'UIKit'
    ss.frameworks = 'Foundation'
  end

	s.dependency 'Result','0.6-beta.1'
  s.dependency 'Quick' , '0.6.0'
  s.dependency 'Nimble', '2.0.0-rc.3'

end

