Rails.application.routes.draw do
  root to: 'tickets#index'
  get '/tickets/:id', to: 'tickets#show', as: 'ticket'
end
