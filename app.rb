require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require './models.rb'

set :root, File.expand_path(__dir__) # app.rb のあるディレクトリをrootに指定
set :views, File.join(settings.root, 'views')

set :bind, '0.0.0.0'
set :port, 4567

get '/' do
  erb :home
end

get '/dashboard' do
  erb :dashboard, layout: false
end

get '/trip/new' do
  erb :trip_new
end

post '/trip/new' do
  flight_number = params[:flight_number]
  flight_date = params[:flight_date]
  trip_name = params[:trip_name]

  Trip.create(
    flight_number: params[:flight_number],
    flight_date: params[:flight_date],
    trip_name: params[:trip_name]
  )

  redirect '/dashboard'
end
