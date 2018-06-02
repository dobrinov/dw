Rails.application.routes.draw do
  resources :jobs, only: %i(index show new create) do
    get :preview, on: :collection
    get :expired, on: :member
  end

  get :contact, to: 'static_pages#contact'
  get :sitemap, to: 'sitemaps#index', defaults: { format: 'xml' }

  root to: 'jobs#index'
end
