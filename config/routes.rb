Rails.application.routes.draw do
  root 'tree2#index'

  get 'tree2' => 'tree2#index'

  get 'tree2/index'

  get 'tree2/show'

  get 'tree2/download'

  get 'tree2/browse'

  get 'tree/show'

  get 'tree/download' => 'tree#download'

  get 'tree/browse'

  get 'tree/index'

  get 'tree/' => 'tree#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
