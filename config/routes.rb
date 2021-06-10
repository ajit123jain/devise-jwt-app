Rails.application.routes.draw do
  # devise_for :admins
  scope '/api' do
    scope '/v1' do 
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
