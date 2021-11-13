Rails.application.routes.draw do
  resources :links, only: %i[index new create]
  get '/:token', to: 'visits#token_redirection', as: :token_redirection
  get '/:token/info', to: 'links#show', as: :link_info
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'links#new'
end
