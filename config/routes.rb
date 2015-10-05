Rails.application.routes.draw do
  root to: 'welcome#index'
  post '/', to: 'welcome#search'
end
