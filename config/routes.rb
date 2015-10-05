Rails.application.routes.draw do
  root to: 'welcome#index'
  post '/', to: 'welcome#search'
  post '/songs', to: 'welcome#get_songs'
  post '/update', to: 'welcome#update'
end
