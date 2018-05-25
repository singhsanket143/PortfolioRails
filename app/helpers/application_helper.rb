module ApplicationHelper

  def login_helper
    if current_user.is_a?(GuestUser)
      (link_to 'Register', new_user_registration_path) +
          "<br>".html_safe +
          (link_to 'Login', new_user_session_path)

    else
      link_to 'Logout', destroy_user_session_path, method: :delete
    end
  end

  def source_helper layout
    if session[:source]
      greeting = "Thanks for visiting us from #{session[:source]} and you are at the #{layout} layout"
      content_tag(:p, greeting, class: "source-greeting")
    end
  end

  def copyright_generator
    @copyright = SanketViewTool::Renderer.copyright "Sanket Singh ", " All Rights Reserved"
  end
end
