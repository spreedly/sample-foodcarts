require 'sinatra'
require 'rack/session/pool'
require 'rack/protection'
require_relative 'env'

use Rack::Session::Pool, :expire_after => 2592000
use Rack::Protection
use Rack::Protection::AuthenticityToken

helpers do
  def view(template)
    @active = template
    erb template
  end

  def h(text)
    Rack::Utils.escape_html(text)
  end

  def hattr(text)
    Rack::Utils.escape_path(text)
  end
end

before do
  @cart = session[:cart]
  @gateway = session[:gateway]
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
  @cart ? view(:cart) : redirect(to('/'))
end

post '/delete' do
  session[:cart] = session[:gateway] = nil
  redirect to('/')
end

post '/gateway' do
  if params[:gateway_token].to_s.length > 0
    session[:gateway] = params
    # TODO retain this thang!
    redirect to('/cart')
  else
    @error = "Hrmph... seems something has gone wrong."
    view :cart
  end
end