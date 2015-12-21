module ApplicationHelper
  def format_url(url)
    url.start_with?('http://', 'https://') ? url : 'http://' + url
  end

  def is_need_header_or_footer?
    # !(current_page?(new_user_session_path) || current_page?(new_user_registration_path) || current_page?(new_user_password_path) ||
    #   current_page?(new_user_confirmation_path) || (params[:controller] == 'static_pages' && params[:action] == 'home'))
    !((params[:controller] == 'static_pages' && params[:action] == 'home'))
  end

  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.name)
  end

  def find_comments_group(post)
    comments = post.comments
    user_ids = comments.pluck(:user_id)
    user_ids.map { |id| User.find(id) }.zip(comments)
  end

  def match_action?(action_name)
    params[:action] == action_name.to_str
  end
end
