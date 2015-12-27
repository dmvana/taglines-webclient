Rails.application.routes.draw do
  get '/taglines' => 'taglines#index'
  get '/taglines/:id' => 'taglines#show'
  get '/taglines/new' => 'taglines#new'
  post '/taglines' => 'taglines#create'
  get '/taglines/:id/edit' => 'taglines#edit'
  patch '/taglines/:id' => 'taglines#update'
  delete '/taglines/:id' => 'taglines#destroy'
end
