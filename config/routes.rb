Rails.application.routes.draw do
  scope '/api' do
    scope '/v1' do 
      devise_for :admins, defaults: { format: :json },
                controllers: {
                    sessions: 'api/v1/admins/sessions',
                    registrations: 'api/v1/admins/registrations'
                }  
      devise_for :users, defaults: { format: :json },
      controllers: {
          sessions: 'api/v1/users/sessions',
          registrations: 'api/v1/users/registrations'
      }        
      get '/member-data', to: 'members#show'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
