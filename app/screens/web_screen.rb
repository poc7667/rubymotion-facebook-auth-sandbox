class WebScreen < PM::WebScreen
  title "LazyAIR"
  attr_accessor :url
  status_bar :none

  def content
    NSURL.URLWithString(@url)
  end
end