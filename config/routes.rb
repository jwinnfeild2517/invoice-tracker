Rails.application.routes.draw do
  root to: 'invoices#index'
  resources :invoices, path_names: { invoices: "dashboard" }
  resources :items
  match '*path', to: ->(env) { [404, {}, ['Oops Something Went Wrong...Check URL']] }, via: :all
end
