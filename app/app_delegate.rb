class AppDelegate< PM::Delegate
  # def application(application, didFinishLaunchingWithOptions:launchOptions)
  #   rootViewController = UIViewController.alloc.init
  #   rootViewController.title = 'lazybird'
  #   rootViewController.view.backgroundColor = UIColor.whiteColor

  #   navigationController = UINavigationController.alloc.initWithRootViewController(rootViewController)

  #   @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
  #   @window.rootViewController = navigationController
  #   @window.makeKeyAndVisible

  #   true
  # end
    def on_load(app, options)
        # open BaseScreen.new(nav_bar: true, path: '/')
        site_url = "http://lazyair.co"
        open_tab_bar WebScreen.new(url: site_url)#HomeScreen.new(nav_bar: true)#, ForumScreen.new(nav_bar: true)# , HelpScreen.new(nav_bar: true)
    end
end
