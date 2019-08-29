Rails.application.routes.draw do
  root 'home#top'
  get 'home/about'
  get 'books/index'
  devise_for :users
  # For details on the DSL available within this fx,:new,ile, see http://guides.rubyonrails.org/routing.html
	resources :users
	resources :books
	get "abouts"=> 'users#about'
	get "signup"=> 'users#signup'
	get "login"=> 'users#login'

end
