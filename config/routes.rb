Rails.application.routes.draw do
  resources :candidates
  devise_for :users, :controllers => { omniauth_callbacks: 'user/omniauth_callbacks'}
  get 'register/info1'

  get 'register/info2'

  get 'pages/main'
	get '/about' => 'pages#about', as: 'about'
	
	mount Shrine.download_endpoint => "/attachments"
		
  root 'pages#main'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
