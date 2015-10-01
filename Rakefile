# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'
require 'bubble-wrap'

begin
  require 'bundler'
  Bundler.require
rescue LoadError
end

# dotenv 載入順序要在 bundler 後面
require 'dotenv'
Dotenv.load
# ENV['device_name'] ||= 'iPhone 6s'

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'LazyAIR'
#  app.deployment_target = "7.1"
  app.identifier = 'com.lazyair.sandbox'
  app.seed_id = ENV["SEED_ID"]
  app.info_plist["UIViewControllerBasedStatusBarAppearance"] = false



  app.pods do
    pod 'Facebook-iOS-SDK'#, '~> 3.16.2'
  end
  # Building with `rake device`
  app.development do
    app.codesign_certificate = ENV['codesign_certificate']
    app.provisioning_profile = ENV['provisioning_profile']
    app.entitlements['aps-environment'] = 'development'
    app.entitlements['get-task-allow'] = true
    app.entitlements['keychain-access-groups'] = [
       app.seed_id + '.' + app.identifier
    ]
    puts app.codesign_certificate
    puts app.provisioning_profile
  end

  # Building for Ad Hoc or App Store distribution
  app.release do
    app.entitlements["aps-environment"] = "production"
  end  

  app.entitlements['aps-environment'] = 'development'
  app.info_plist['FacebookAppID'] = "1610673475838028"
  app.info_plist['CFBundleURLTypes'] = [ { CFBundleURLSchemes: ["fb#{ENV['FB_APP_ID']}"] }]
  puts app.info_plist

end
