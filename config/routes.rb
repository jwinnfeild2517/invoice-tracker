Rails.application.routes.draw do
  resources :invoices, path_names: { invoices: "dashboard" }
  resources :items



  root to: 'invoices#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
