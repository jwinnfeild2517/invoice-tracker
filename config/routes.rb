Rails.application.routes.draw do
  resources :invoices, path_names: { invoices: "dashboard" }

  post '/new/item', to: 'items#create'


  root to: 'invoices#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
