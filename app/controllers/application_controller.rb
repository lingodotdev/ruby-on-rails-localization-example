class ApplicationController < ActionController::Base
  before_action :set_locale

  private

  def set_locale
    I18n.locale = params[:locale] ||
                  http_accept_locale ||
                  I18n.default_locale
  end

  def http_accept_locale
    request.env["HTTP_ACCEPT_LANGUAGE"]
      &.scan(/[a-z]{2}/)
      &.find { |l| I18n.available_locales.map(&:to_s).include?(l) }
  end

  def default_url_options
    { locale: I18n.locale }
  end
end
