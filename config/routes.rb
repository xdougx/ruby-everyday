Rails.application.routes.draw do
  root "blog/home#home"

  scope "backoffice", module: "backoffice", as: "backoffice" do  
    root "home#home"

    namespace "authentication" do
      get "sign_in"
      get "sign_out"
      post "authenticate"
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
  get "the-author" => "blog/home#author"
  get "/:category/:id" => "blog/home#show"
  get "/:category" => "blog/home#category"
end
