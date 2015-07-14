# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'

begin
  require 'bundler'
  Bundler.require
rescue LoadError
end

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'lazybird'
  app.info_plist["UIViewControllerBasedStatusBarAppearance"] = false
  app.pods do
    pod 'MGSwipeTableCell'
    pod 'XMLReader', '0.0.2'
    pod 'GDataXML-HTML'
  end
  app.identifier = 'com.4am-studio.taiwan-water-info'
  app.codesign_certificate = 'iPhone Developer: Wei Cheng Hsu'
  # app.codesign_certificate = 'iPhone Distribution: Wei Cheng Hsu'
  app.provisioning_profile = '/Users/hsu-wei-cheng/Dropbox/ios-dev/i6_provision_profile.mobileprovision'
  # app.provisioning_profile = '~/Dropbox/ios-dev/Taiwan_water_information.mobileprovision'

end
