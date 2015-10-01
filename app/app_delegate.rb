class AppDelegate < PM::Delegate
  include PM::DelegateNotifications
  attr_accessor :facebook, :loading_alert, :current_user

  def application(application, didFinishLaunchingWithOptions:launchOptions)
    # open_tab_bar WebScreen.new(url: site_url)#HomeScreen.new(nav_bar: true)#, ForumScreen.new(nav_bar: true)# , HelpScreen.new(nav_bar: true)
    @window                    = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = UINavigationController.alloc.initWithRootViewController(MainController.new)
    @window.makeKeyAndVisible
    true    
  end

  def application(_, openURL:url, sourceApplication:sourceApplication, annotation:_)
    FBAppCall.handleOpenURL(url, sourceApplication:sourceApplication)
  end

  def applicationDidBecomeActive(application)
    FBSession.activeSession.handleDidBecomeActive
  end

  def applicationWillTerminate(application)
    FBSession.activeSession.close
  end


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
    puts error.code
    NSLog(error.inspect)
  end

  def application(application, didReceiveRemoteNotification: user_info)  
    NSLog("%@", user_info[:aps][:alert])
    NSLog("%@", user_info[:some_extra_data])
    alert_log(user_info[:some_extra_data])
  end    

  def alert_log(message)
    alert = UIAlertView.new 
    alert.message = message
    alert.show
  end 



end
