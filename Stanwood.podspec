Pod::Spec.new do |s|
  s.name             = 'Stanwood'
  s.version          = '1.0.0'
  s.summary          = 'An umbrella pod for all the pods developed at Stanwood GmbH.'

  s.description      = <<-DESC
  This pod is an umbrella for all the other pods in the company:
  StanwoodCore, StanwoodAnalytics, StanwoodChat, StanwoodDialog, StanwoodGroupChain.
  STWSocialKit and StanwoodUITesting are not updated to Swift 4.0 just yet and are not included.
                       DESC

  s.homepage         = 'https://github.com/stanwood/Stanwood_Root_iOS'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'stanwood' => 'ios.frameworks@stanwood.io' }
  s.source           = { :git => 'https://github.com/stanwood/Stanwood_Root_iOS.git', :tag => s.version.to_s }

  s.default_subspec = 'Core','Analytics'

  s.ios.deployment_target = '10.0'

  s.subspec 'Core' do |ss|
      ss.dependency 'StanwoodCore'
  end

  s.subspec 'Analytics' do |ss|
      ss.dependency 'StanwoodAnalytics'
  end

  # Not public yet.
  #s.subspec 'Chat' do |ss|
  #      ss.dependency 'StanwoodChat'
  #  end

  s.subspec 'Dialog' do |ss|
      ss.dependency 'StanwoodDialog'
  end

  s.subspec 'GroupChain' do |ss|
      ss.dependency 'StanwoodGroupChain'
  end

  s.subspec 'UITesting' do |ss|
      ss.dependency 'StanwoodUITesting'
      ss.frameworks = 'XCTest'
  end

end
