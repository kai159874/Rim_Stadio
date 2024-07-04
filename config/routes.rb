Rails.application.routes.draw do

  root to: "public/homes#top"

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  devise_for :users, skip: [:passwords] , controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  scope module: :public do
    get   'mypage'                  => 'users#mypage', as: "mypage"
    get   'mypage/edit'             => 'users#edit', as: "mypage_edit"
    patch 'mypage'                  => 'users#update'
    get   'unsubscribe'             => 'users#unsubscribe', as: "unsubscribe"
    patch 'withdrow'                => 'users#withdrow', as: "withdrow"
    resources :disks
    resources :users, only: [:show]
  end





  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
