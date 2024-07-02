Rails.application.routes.draw do

  root to: "public/homes#top"

  devise_for :admin,skip: [:passwords], controllers: {
    sessions: "admin/sessions"
  }
  devise_for :users, skip: [:registrations, :passwords] , controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  namespace :public do
    get 'disks/new'
    get 'disks/show'
    get 'disks/index'
    get 'disks/edit'
  end





  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
