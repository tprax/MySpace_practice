Rails.application.routes.draw do
  get 'posts/index'
  get 'posts/show'
  get 'posts/create'
  get 'posts/update'
  get 'posts/destroy'
  mount_devise_token_auth_for 'User', at: 'api/auth'
  namespace :api do
    #API ROUTES SHOULD GO HERE
  end

  #Do not place any routes below this one
  if Rails.env.production?
    get '*other', to: 'static#index'
  end
end
