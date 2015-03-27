Rails.application.routes.draw do
  root "blog/home#home"
  get "/:category/:id" => "blog/home#show"
  get "the-author" => "blog/home#author"

  scope "backoffice", module: "backoffice", as: "backoffice" do  
    root "home#home"

    namespace "auth" do
      get "login" => "authentication#sign_in" 
      post "authenticate" => "authentication#authenticate" 
    end

    resources :articles do
      member do
        get 'publish'
        get 'unpublish'
      end
    end

    resources :categories do
    end

    resources :users do
    end
  end
end
