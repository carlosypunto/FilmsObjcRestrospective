platform :ios, '10.0'

target 'FilmsObjcRestrospective' do

  pod 'AFNetworking', '~> 3.0'
  pod 'Mantle', '~> 2.1'
  pod 'MTLManagedObjectAdapter', '~> 1.0'
  pod 'Bolts', '~> 1.9'

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
    end
  end
end