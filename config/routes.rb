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

   root to: 'eateries#index'
   resources :eateries do
     collection do
       post :import
       #post :review_import
     end
     resources :reviews, except: [:index]
   end

   resources :reviews, only: [:index] do
     collection do
       post :review_import
     end
   end

   resources :specials

   get 'contact' => 'contact#index'
   post 'confirm' =>'contact#confirm'
   post 'thanks' => 'contact#thanks'
end
