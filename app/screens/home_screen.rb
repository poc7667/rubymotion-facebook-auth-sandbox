class HomeScreen < PM::Screen
  def on_load
    print("on_load")
    site_url = "http://192.168.1.7:3000/"
    # site_url = "http://4am-lesson.com:3001/"
    print(site_url)
    open WebScreen.new(url: site_url)
  end
end