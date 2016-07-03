Tshtask::Application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
  authenticate :user do
    root :to => "home#index"
    resources :users, except: [:show, :index]
    resources :money, except: [:delete, :edit, :update, :create, :new] do
      collection do
        post 'refresh_rates'
        get 'report'
        get 'all_currencies'
      end
    end
  end
end
