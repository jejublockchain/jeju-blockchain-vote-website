Rails.application.routes.draw do
  get 'pages/main'
	get '/about' => 'pages#about', as: 'about'
	
  root 'pages#main'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
