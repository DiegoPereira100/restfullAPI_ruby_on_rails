Rails.application.routes.draw do
  resources :kinds

  scope module: 'v1' do
    resources :contacts, :constraints => lambda { |request| request.params[:version] == "1" } do
      resource :kind, only: [:show]
      resource :kind, only: [:show], path: 'relationships/kind'
      
      resource :phones, only: [:show]
      resource :phones, only: [:show], path: 'relationships/phones'
      
       resource :phone, only: [:update, :create, :destroy]
      resource :phone , only: [:update, :create, :destroy], path: 'relationships/phones'
      
      resource :address, only: [:show, :update, :post, :destroy]
      resource :address, only: [:show, :update, :post, :destroy], path: 'relationships/address'
    end
  end
  
  scope module: 'v2' do
    resources :contacts, :constraints => lambda { |request| request.params[:version] == "2" } do
      resource :kind, only: [:show]
      resource :kind, only: [:show], path: 'relationships/kind'
      
      resource :phones, only: [:show]
      resource :phones, only: [:show], path: 'relationships/phones'
      
       resource :phone, only: [:update, :create, :destroy]
      resource :phone , only: [:update, :create, :destroy], path: 'relationships/phones'
      
      resource :address, only: [:show, :update, :post, :destroy]
      resource :address, only: [:show, :update, :post, :destroy], path: 'relationships/address'
    end
  end
end
