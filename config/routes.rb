Rails.application.routes.draw do
  
  get "/" => "home#top"
  get "about" => "home#about"
  
  get "roadmap/editshow/:id" => "roadmaps#editshow"
  get "roadmap/medit/:id" => "roadmaps#medit"
  get "roadmap/editz/:id" => "roadmaps#editz"
  get "roadmap/editsend/:id" => "roadmaps#editsend"
  get "roadmap/edit/:id" => "roadmaps#edit"
  post "roadmap/updateshow/:id" => "roadmaps#updateshow"
  post "roadmap/updatemap/:id" => "roadmaps#updatemap"
  post "roadmap/updateedit/:id" => "roadmaps#updateedit"
  post "roadmap/update/:id" => "roadmaps#update"
  post "roadmap/destroyshow/:id" => "roadmaps#destroyshow"
  post "roadmap/destroyz/:id" => "roadmaps#destroyz"
  post "roadmap/destroyall/:id" => "roadmaps#destroyall"
  post "roadmap/destroymap/:id" => "roadmaps#destroymap"
  post "roadmap/destroymy/:id" => "roadmaps#destroymy"
  post "roadmap/create" => "roadmaps#create"
  get "roadmap/new" => "roadmaps#new"
  get "roadmap/new/:id" => "roadmaps#new_show"
  post "roadmap/add" => "roadmaps#add"
  post "roadmap/fini" => "roadmaps#fini"
  post "roadmap/mfini" => "roadmaps#mfini"
  get "roadmap/1" => "roadmaps#front"
  get "roadmap/2" => "roadmaps#back"
  get "roadmap/3" => "roadmaps#web"
  get "roadmap/4" => "roadmaps#free"
  get "roadmap/1/:id" => "roadmaps#show"
  get "roadmap/2/:id" => "roadmaps#show"
  get "roadmap/3/:id" => "roadmaps#show"
  get "roadmap/4/:id" => "roadmaps#show"
  get "roadmap/myshow/:id" => "roadmaps#myshow"
  get "roadmap/mapedit/:id" => "roadmaps#mapedit"
  
  get "user/new" => "users#new"
  get "user/show/:id" => "users#showpage"
  get "user/road/:id" => "users#roadeach"
  get "user/mroadi/:id" => "users#mroadi"
  post "user/create" => "users#create"
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end