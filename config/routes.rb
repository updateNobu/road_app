Rails.application.routes.draw do
  get 'users/new'
  get 'users/showpage'
  get "/" => "home#top"
  get "about" => "home#about"
  
  get "roadmap/editshow/:id" => "roadmaps#editshow"
  get "roadmap/editz/:id" => "roadmaps#editz"
  get "roadmap/editsend/:id" => "roadmaps#editsend"
  get "roadmap/edit/:id" => "roadmaps#edit"
  post "roadmap/updateshow/:id" => "roadmaps#updateshow"
  post "roadmap/updateedit/:id" => "roadmaps#updateedit"
  post "roadmap/update/:id" => "roadmaps#update"
  post "roadmap/destroyshow/:id" => "roadmaps#destroyshow"
  post "roadmap/destroyz/:id" => "roadmaps#destroyz"
  post "roadmap/destroyall/:id" => "roadmaps#destroyall"
  post "roadmap/create" => "roadmaps#create"
  get "roadmap/new" => "roadmaps#new"
  get "roadmap/new/:id" => "roadmaps#new_show"
  post "roadmap/add" => "roadmaps#add"
  post "roadmap/fini" => "roadmaps#fini"
  get "roadmap/1" => "roadmaps#front"
  get "roadmap/2" => "roadmaps#back"
  get "roadmap/3" => "roadmaps#web"
  get "roadmap/4" => "roadmaps#free"
  get "roadmap/1/:id" => "roadmaps#show"
  get "roadmap/2/:id" => "roadmaps#show"
  get "roadmap/3/:id" => "roadmaps#show"
  get "roadmap/4/:id" => "roadmaps#show"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end