Rails.application.routes.draw do
  root :to => 'dashboard#index'
  get 'dashboard/index'
  post 'dashboard/import_image'
  get 'dashboard/show_selected_image'
  get 'image_list' => 'dashboard#image_list'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
