Rails.application.routes.draw do
  
  get "/" => "home#top"
  get "about" => "home#about"
  
  get "roadmap/editshow/:id" => "roadmaps#editshow"
  get "roadmap/cmrsedit/:id" => "roadmaps#cmrsedit"
  get "roadmap/medit/:id" => "roadmaps#medit"
  get "roadmap/editz/:id" => "roadmaps#editz"
  get "roadmap/mreiz/:id" => "roadmaps#mreiz"
  get "roadmap/editsend/:id" => "roadmaps#editsend"
  get "roadmap/mrei/:id" => "roadmaps#mrei"
  get "roadmap/edit/:id" => "roadmaps#edit"
  get "roadmap/myre/:id" => "roadmaps#myre"
  get "roadmap/myroad/:id" => "roadmaps#myroad"
  post "roadmap/updateshow/:id" => "roadmaps#updateshow"
  post "roadmap/updatemap/:id" => "roadmaps#updatemap"
  post "roadmap/updateedit/:id" => "roadmaps#updateedit"
  post "roadmap/updatemrei/:id" => "roadmaps#updatemrei"
  post "roadmap/update/:id" => "roadmaps#update"
  post "roadmap/updatemyre/:id" => "roadmaps#updatemyre"
  post "roadmap/updatemyroad/:id" => "roadmaps#updatemyroad"
  post "roadmap/updatecmr/:id" => "roadmaps#updatecmr"
  post "roadmap/destroyshow/:id" => "roadmaps#destroyshow"
  post "roadmap/destroycmr/:id" => "roadmaps#destroycmr"
  post "roadmap/destroyz/:id" => "roadmaps#destroyz"
  post "roadmap/destroyall/:id" => "roadmaps#destroyall"
  post "roadmap/destroymap/:id" => "roadmaps#destroymap"
  post "roadmap/destroymy/:id" => "roadmaps#destroymy"
  post "roadmap/destroymre/:id" => "roadmaps#destroymre"
  post "roadmap/create" => "roadmaps#create"
  post "roadmap/cmr" => "roadmaps#cmr"
  get "roadmap/new" => "roadmaps#new"
  get "roadmap/new/:id" => "roadmaps#new_show"
  get "roadmap/cmroad" => "roadmaps#cmroad"
  get "roadmap/cmroad/:id" => "roadmaps#cmroads"
  post "roadmap/add" => "roadmaps#add"
  post "roadmap/finicmr" => "roadmaps#finicmr"
  post "roadmap/fini" => "roadmaps#fini"
  post "roadmap/mfini" => "roadmaps#mfini"
  post "roadmap/mrefini" => "roadmaps#mrefini"
  post "/roadmap/choosefl/:id" => "roadmaps#choosefl"
  post "/roadmap/choosefm/:id" => "roadmaps#choosefm"
  get "roadmap/1" => "roadmaps#front"
  get "roadmap/2" => "roadmaps#back"
  get "roadmap/3" => "roadmaps#web"
  get "roadmap/4" => "roadmaps#free"
  get "roadmap/1/:id" => "roadmaps#show"
  get "roadmap/2/:id" => "roadmaps#show"
  get "roadmap/3/:id" => "roadmaps#show"
  get "roadmap/4/:id" => "roadmaps#show"
  get "roadmap/myshow/:id" => "roadmaps#myshow"
  get "roadmap/cfmrshow/:id" => "roadmaps#cfmrshow"
  get "roadmap/mapedit/:id" => "roadmaps#mapedit"
  get "roadmap/likeshow/:id" => "roadmaps#likeshow"
  get "roadmap/cflshow/:id" => "roadmaps#cflshow"
  
  get "user/new" => "users#new"
  get "login" => "users#login_form"
  get "user/show/:id" => "users#showpage"
  get "user/showedit/:id" => "users#showedit"
  get "user/road/:id" => "users#roadeach"
  get "user/mroadi/:id" => "users#mroadi"
  get "user/cfmroad/:id" => "users#cfmroad"
  get "user/:id/likepage" => "users#likepage"
  get "user/:id/cflike" => "users#cflike"
  post "user/create" => "users#create"
  post "login" => "users#login"
  post "logout" => "users#logout"
  post "user/updateshow/:id" => "users#updateshow"
  post "/user/destroy/:id" => "users#destroy"
  
  
  post "like/:roadmap_id/create" => "likes#create"
  post "like/:roadmap_id/destroy" => "likes#destroy"
  post "like/:roadmap_id/createshow" => "likes#createshow"
  post "like/:roadmap_id/destroyshow" => "likes#destroyshow"
  post "like/:roadmap_id/createlike" => "likes#createlike"
  post "like/:roadmap_id/destroylike" => "likes#destroylike"
  post "like/:roadmap_id/createlksw" => "likes#createlksw"
  post "like/:roadmap_id/destroylksw" => "likes#destroylksw"
  post "like/:roadmap_id/createmroadi" => "likes#createmroadi"
  post "like/:roadmap_id/destroymroadi" => "likes#destroymroadi"
  post "like/:roadmap_id/createmrims" => "likes#createmrims"
  post "like/:roadmap_id/destroymrims" => "likes#destroymrims"
end