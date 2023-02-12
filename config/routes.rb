Rails.application.routes.draw do
   
  root "main#index", as: 'home'
  root "categories#index"
  #root "operations#index"
  
  #get 'operations/:id', as: 'operations#index'


  get 'category/:id', to: 'category#index'
  get 'reports/index'
  get 'reports/report_by_category'
  get 'reports/report_by_dates'
  get 'main/index'
  
  resources :categories do
    resources :operations
  end 
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
end
