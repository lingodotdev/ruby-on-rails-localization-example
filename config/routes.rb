Rails.application.routes.draw do
  scope "(:locale)", locale: /en|es|fr|de/ do
    root "home#index"
  end
end
