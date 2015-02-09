module ApplicationHelper
  def nav_menu
    links = "<li>#{ link_to('Home', root_path) }</li>
              <li>#{ link_to('Artists', artists_path) }</li>
              <li>#{ link_to('Events', events_path) }</li>
              <li>#{ link_to('Reviews', reviews_path) }</li>"

    if @current_user.present?
      if @current_user.is_admin?
        links += "<li>#{ link_to('All users', users_path) }</li>"
      end
      
      links += "<li>#{ link_to(@current_user.first_name, user_path(@current_user)) } <i class='fa fa-user'></i></li>
      <li>#{ link_to('Sign Out ', login_path, :method => :delete) }<i class='fa fa-sign-out'></i></li>"
    else
      links += "<li>#{ link_to('Sign up', new_user_path, :class => "btn-signup") }</li>
        <li>#{ link_to('Sign in', login_path) } <i class='fa fa-sign-in'></i></li>"
    end
    links
  end

end
