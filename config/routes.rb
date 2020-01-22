Rails.application.routes.draw do


  resources :subjects do
    member do
      get :delete
    end
  end

  # get 'sections/index'
  # get 'sections/show'
  # get 'sections/new'
  # get 'sections/edit'
  # get 'sections/delete'
  # get 'pages/index'
  # get 'pages/show'
  # get 'pages/new'
  # get 'pages/edit'
  # get 'pages/delete'
  # root 'demo#index'
  resources :pages do 
    member do
      get :delete
    end
  end

  resources :sections do 
    member do
      get :delete
    end
  end


  get 'demo/index'
  get 'demo/hello'
  get 'demo/other_hello'
  get 'demo/google'
  get 'demo/escape_output'
  # another way:
  # match "demo/index", :to => "demo#index", :via => :get
  # default route:
  # get ':controller(/:action(/:id))'
  # root route:
  # root 'demo#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
