ActionController::Base.class_eval do

  attr_accessor :current_theme

  ##
  # Use it like the Rails <tt>layout</tt> macro.
  #
  # Example:
  #
  #     theme "theme"
  #
  # -or-
  #
  #     theme :set_theme
  #
  #     def set_theme
  #       request.domain
  #     end
  #
  def self.theme(site_theme)
    write_inheritable_attribute "theme", site_theme
    before_filter :add_theme_path
  end

  protected

  def add_theme_path
    current_theme
    self.prepend_view_path(theme_views_path)
  end

  def current_theme
    theme = self.class.read_inheritable_attribute("theme")

    @current_theme = case theme
                     when Proc   then theme.call(self)
                     when String then theme
                     when Symbol then send(theme)
                     end
  end

  def theme_path
    "#{Rails.public_path}/themes/#{current_theme}"
  end

  def theme_views_path
    theme_path + "/views"
  end

  def theme_assets_path
    "/themes/#{current_theme}/assets"
  end
  helper_method :theme_assets_path

end
