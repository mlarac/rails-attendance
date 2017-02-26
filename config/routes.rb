Rails.application.routes.draw do
  resources :events do
    member do
      get :createattendance
	end
  end
  resources :members
  resources :event_attendance
  root :to => redirect('/events/')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
