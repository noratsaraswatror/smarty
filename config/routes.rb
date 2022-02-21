Rails.application.routes.draw do

  get 'reports/index'
  get 'reports/daily_report'
  get 'reports/monthly_report'
  get 'reports/month_on_report'
  resources :blood_readings
  #get 'welcome/index'
  devise_for :users
  root to: "welcome#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
