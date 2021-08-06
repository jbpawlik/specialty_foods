Rails.application.routes.draw do

  #I decided to create a "landing page" instead of having the site root to the products index. I hope that is okay (especially because making a custom route is more complex than adding "root to: products#index")

  get '/', to:
    'products#landing'

  resources :products do
    resources :reviews 
  end
end
