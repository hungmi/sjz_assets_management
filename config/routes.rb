Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "pages#dashboard"
  resources :items do
    collection do
      post "upload"
      get "list"
    end
  end
  get "/employees/:id/items", to: "employee_items#index", as: "employee_items"
  get "/department/:id/items", to: "department_items#index", as: "department_items"
  resources :employees do
    collection do
      post "upload"
      get "list"
    end
  end
  resources :departments
end
