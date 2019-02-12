platform :ios, '10.0'

target 'FilmsObjcRestrospective' do

  pod 'AFNetworking', '~> 3.0'
  pod 'Mantle', '~> 2.1', :inhibit_warnings => true
  pod 'MTLManagedObjectAdapter', '~> 1.0', :inhibit_warnings => true
  pod 'Bolts', '~> 1.9', :inhibit_warnings => true
  
  pod 'CocoaAsyncSocket', '~> 7.6.3', :modular_headers => true, :inhibit_warnings => true
  pod 'Bagel', '~> 1.3.2', :inhibit_warnings => true

  target 'FilmsObjcRestrospectiveTests' do
    inherit! :search_paths
    
    
  end

  target 'FilmsObjcRestrospectiveUITests' do
    inherit! :search_paths

    
  end

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '10.0'
#      config.build_settings['GCC_WARN_INHIBIT_ALL_WARNINGS'] = "YES"
    end
  end
end