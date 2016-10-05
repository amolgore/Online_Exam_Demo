Rails.application.routes.draw do

  

  resources :answers
  resources :questions
  resources :options
  resources :surveys
  resources :comments, only: [:index, :create]
  get '/comments/new/(:parent_id)', to: 'comments#new', as: :new_comment
  
  # get 'user_dashboard/home'

  # get 'welcome#index'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

Rails.application.routes.draw do
    devise_for :users, controllers: {
        confirmations: 'users/confirmations',
        registrations: 'users/registrations',
        passwords: 'users/passwords',
        sessions: 'users/sessions'
    }
  end
  # You can have the root of your site routed with "root"
  root 'welcome#index'

  # Example of regular route:
    # get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
    get 'teacherDashboard' => 'teacher_dashboard#home', as: :teacher_dashboard

    get 'studentDashboard' => 'student_dashboard#home', as: :student_dashboard
     
    post 'submitAnswers' => 'student_dashboard#submit_student_answer', as: :submit_student_answer

    delete '/deleteAnswers' => 'student_dashboard#destroy_student_answer'

    patch  '/submit_answer' => 'teacher_dashboard#submit_answer', as: :submit_answer
  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
