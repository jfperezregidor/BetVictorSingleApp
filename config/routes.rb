Rails.application.routes.draw do
  resources :sports
  #get 'dashboard/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root 'dashboard#index'
    #~ namespace :api do
      #~ namespace :v1 do
        #~ resources :sports
      #~ end
    #~ end
    namespace :api do
      namespace :v1 do
        resources :sports, :id => :id do |event|
          resources :events, :id_event => :id do |outcomens|
            resources :outcomens
          end
        end
      end
    end
end
