Rails.application.routes.draw do
    resources :socars

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root 'posts#index'
    
    get '/posts'                =>'posts#index'
    get '/posts/new'            =>'posts#new'
    post '/posts'               =>'posts#create'
    get '/posts/:id'            =>'posts#show'
    get '/posts/:id/edit'       =>'posts#edit'
    patch '/posts/:id/update'   =>'posts#update'
    put '/posts/:id/update'     =>'posts#update'
    delete '/posts/:id'         =>'posts#destroy'
end
