Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post '/recieve-order' => 'transfer#recieve_order'
  post '/recieve-confirmation' => 'transfer#recieve_confirmation'

end
