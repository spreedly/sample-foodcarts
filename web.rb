require 'sinatra'
require 'rack/session/pool'

use Rack::Session::Pool, :expire_after => 2592000

helpers do
	def view(template)
		@active = template
		erb template
	end
end

before do
	@cart = session[:cart]
end

get '/' do
	view :index
end

get '/about' do
	view :about
end

post '/carts' do
	if params[:cart_name].to_s.length > 0
		session[:cart] = params
		redirect to('/cart')
	else
		@error = "Please do provide a bit more information."
		view :index
	end
end

get '/cart' do
	view :cart
end

get '/delete' do # bad boy
	session[:cart] = nil
	redirect to('/')
end