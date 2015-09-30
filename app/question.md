Got useless error from notification

When the app launched it will show me the window

![](https://i.imgur.com/KXOg4zv.png)

I got the error from console, `#<NSError:0x11a229660>`

and not knowing what happened at all.

any idea ?

![](https://i.imgur.com/8CPqf4z.png)


# rakefile

    # -*- coding: utf-8 -*-
    $:.unshift("/Library/RubyMotion/lib")
    require 'motion/project/template/ios'
    require 'bubble-wrap'
    begin
      require 'bundler'
      Bundler.require
    rescue LoadError
    end

    require 'dotenv'
    Dotenv.load

    Motion::Project::App.setup do |app|
      # Use `rake config' to see complete project settings.
      app.name = 'hahaAIR'
      app.identifier = 'com.hahaair.sandbox'
      app.seed_id = ENV["SEED_ID"]
      app.info_plist["UIViewControllerBasedStatusBarAppearance"] = false
      app.development do
        app.codesign_certificate = "iPhone Developer: Wei Cheng "
        app.provisioning_profile = "/secrets/hahaair.mobileprovision"
        app.entitlements['aps-environment'] = 'development'  
        app.entitlements['get-task-allow'] = true  
      end

    end

#AppDelegate

        class AppDelegate< PM::Delegate
          def register_push_notifications  
            if UIApplication.sharedApplication.respondsToSelector("registerUserNotificationSettings:")
              settings = UIUserNotificationSettings.settingsForTypes(UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound, categories: nil)
              UIApplication.sharedApplication.registerUserNotificationSettings(settings)
            else
              UIApplication.sharedApplication.registerForRemoteNotificationTypes(UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound)
            end
          end  
          def application(application, didFinishLaunchingWithOptions:launchOptions)
            puts Device.ios_version
            register_push_notifications  
          end  
          def application(application, didRegisterUserNotificationSettings: notificationSettings)  
            application.registerForRemoteNotifications
          end
          def application(application, didRegisterForRemoteNotificationsWithDeviceToken: device_token)
            puts device_token
            NSLog("My token is: %@", device_token)
          end
          def application(application, didFailToRegisterForRemoteNotificationsWithError: error)
            puts 'didFailToRegisterForRemoteNotificationsWithError'
            puts error.inspect
            puts error
            NSLog(error.inspect)
          end
        end

# I think the pem is valid

![](https://i.imgur.com/BBS7LJy.png)
