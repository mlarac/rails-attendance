Rails.application.routes.draw do
  resources :events
  resources :members
  resources :event_attendance do
    collection do
      post 'remove'
    end
  end
  root :to => redirect('/events/')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
