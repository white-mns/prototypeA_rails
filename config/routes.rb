Rails.application.routes.draw do
  get 'top_page/make_battle_log'
  get 'top_page/privacy'
  root 'top_page#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
