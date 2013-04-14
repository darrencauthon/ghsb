GithubStatusBoard::Application.routes.draw do

  get '/(:token)/(:user/:repo)/issues' => 'issues#index', as: 'issues'

  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root to: 'welcome#index'

end
