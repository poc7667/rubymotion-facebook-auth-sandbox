class AppDelegate< PM::Delegate
  include PM::DelegateNotifications

  def register_push_notifications  
    if UIApplication.sharedApplication.respondsToSelector("registerUserNotificationSettings:")
      settings = UIUserNotificationSettings.settingsForTypes(UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound, categories: nil)
      UIApplication.sharedApplication.registerUserNotificationSettings(settings)
    else
      UIApplication.sharedApplication.registerForRemoteNotificationTypes(UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound)
    end
  end  

  def application(application, didRegisterUserNotificationSettings: notificationSettings)  
    application.registerForRemoteNotifications
  end


  def application(application, didRegisterForRemoteNotificationsWithDeviceToken: device_token)
    clean_token = device_token.description.gsub(" ", "").gsub("<", "").gsub(">", "")
    
    # Log the push notification to the console
    puts clean_token
    NSLog("My token is: %@", clean_token)
  end

  def application(application, didFailToRegisterForRemoteNotificationsWithError: error)
    puts 'didFailToRegisterForRemoteNotificationsWithError'
    puts error.inspect
    puts error
    NSLog(error.inspect)
  end


  def application(application, didReceiveRemoteNotification: user_info)  
    # The push notification information can be accessed on the `:aps` key
    NSLog("%@", user_info[:aps][:alert])

    # The `:other` data you set on the APNS::Notification can be accessed directly
    NSLog("%@", user_info[:some_extra_data])
  end    

  # def on_load(app, options)
  #     # register_for_push_notifications :badge, :sound, :alert, :newsstand
  #     # PM.logger.info registered_push_notifications    
  #     site_url = "http://tw.yahoo.com"
  #     puts site_url
  #     open_tab_bar WebScreen.new(url: site_url)#HomeScreen.new(nav_bar: true)#, ForumScreen.new(nav_bar: true)# , HelpScreen.new(nav_bar: true)
  # end


  def application(application, didFinishLaunchingWithOptions:launchOptions)
    puts Device.ios_version
    register_push_notifications  
    # if Device.ios_version.start_with? "8"
    #   settings = UIUserNotificationSettings.settingsForTypes((UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound | UIRemoteNotificationTypeAlert), categories:nil)
    #   UIApplication.sharedApplication.registerUserNotificationSettings(settings)
    #   UIApplication.sharedApplication.registerForRemoteNotifications
    # else
    #   UIApplication.sharedApplication.registerForRemoteNotificationTypes(UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound)
    # end
    site_url = "http://tw.yahoo.com"
    puts site_url
    open_tab_bar WebScreen.new(url: site_url)#HomeScreen.new(nav_bar: true)#, ForumScreen.new(nav_bar: true)# , HelpScreen.new(nav_bar: true)
  end  


  # def on_unload
  #   unregister_for_push_notifications
  # end

  # def on_push_registration(token, error)
  #   puts 'on_push_registration'
  #   puts token
  #   PM.logger.info token.description
  # end

  # def on_push_notification(notification, launched)
  #   PM.logger.info notification.to_json
  # end  
end
