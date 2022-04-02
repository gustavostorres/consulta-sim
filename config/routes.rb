Rails.application.routes.draw do
  #get 'home/index'
  resources :consulta
  resources :medicos do
    resources only: [:ListagemConsultas]
    get 'listagem' => 'consulta#ListagemConsultas'
  end
  resources :pacientes

  root to: "home#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

end
