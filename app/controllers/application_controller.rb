class ApplicationController < ActionController::Base
  around_action :switch_locale

  private

  def switch_locale(&action)
    locale = params[:locale] || http_accept_locale || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

  def http_accept_locale
    header = request.headers["Accept-Language"].to_s
    header.scan(/[a-z]{2}/).find { |l| I18n.available_locales.map(&:to_s).include?(l) }
  end

  def default_url_options
    { locale: I18n.locale }
  end
end
