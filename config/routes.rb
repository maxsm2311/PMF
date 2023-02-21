Rails.application.routes.draw do
  get '/search', to: 'search#search'
   
  root "main#index", as: 'home'
  #root "reports#index", as: 'reports'
  #root "categories#index"
  #root "operations#index"
  
  #get 'operations/:id', as: 'operations#index'


  #get 'category/:id', to: 'category#index'
  get 'reports/index', as: 'reports'
  get 'reports/report_by_category'
  get 'reports/report_by_dates'
  get 'main/index'
  get 'report_by_dates', to: 'reports#report_by_dates'
  get 'report_by_category', to: 'reports#report_by_category'
  get "reports/report_by_category", to: "reports#report_by_category", as: "report_by_category_reports"
  resources :categories do
    resources :operations
    delete 'operations/:id', to: 'operations#destroy'
  end 

  
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
end