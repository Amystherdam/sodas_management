Rails.application.routes.draw do
  resources :sodas do
    collection do
      delete 'destroy_multiple'
    end
  end
  root 'sodas#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
