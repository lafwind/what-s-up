module ApplicationHelper
  def format_url(url)
    url.start_with?('http://', 'https://') ? url : 'http://' + url
  end

  def need_header_or_footer?
    !(current_page?(new_user_session_path) || current_page?(new_user_registration_path) || current_page?(new_user_password_path) ||
      current_page?(new_user_confirmation_path) || (params[:controller] == 'static_pages' && params[:action] == 'home'))
  end
end
