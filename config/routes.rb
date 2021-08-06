Rails.application.routes.draw do
  # root to: 'products#index'
  
  get '/', to:
    'products#landing'
  
  resources :products do
    resources :reviews 
  end
end
