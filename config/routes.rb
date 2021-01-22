Rails.application.routes.draw do
   #管理者アカウント
   devise_for :admins, controllers: {
     registrations: 'admins/registrations',
     sessions: 'admins/sessions'
   }
   resources :admins, only: [:show]
   #使用者アカウント
   devise_for :users, controllers: {
     registrations: 'users/registrations',
     sessions: 'users/sessions'
   }
   resources :users, only: [:show]

   root to: 'reviews#top'
   #resources :eateries, param: :canonical_name do#, only: [:show, :edit, :update, :destroy] do
   resources :eateries do#, only: [:show, :edit, :update, :destroy] do
     collection do
       post :import
       #post :review_import
     end
     #resources :reviews, param: :visited , except: [:index] #, only: [:show, :edit, :update, :destroy, :confirm, :new]
     resources :reviews, except: [:index] #, only: [:show, :edit, :update, :destroy, :confirm, :new]
   end
   get '/prefecture' => 'reviews#prefecture'

   resources :reviews, only: [:index] do
     collection do
       post :review_import
       get :'confirm'
     end
   end

   resources :specials

   get 'contact' => 'contact#index'
   post 'confirm' =>'contact#confirm'
   post 'thanks' => 'contact#thanks'
end
