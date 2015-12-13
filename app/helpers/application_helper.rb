module ApplicationHelper
  def format_url(url)
    url.start_with?('http://', 'https://') ? url : 'http://' + url
  end
end
