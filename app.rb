#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get '/about' do
	erb :about
end

get '/visit' do
	erb :visit
end

get '/contacts' do
	erb :contacts
end

get '/' do
	erb :index
end

post '/visit' do
	@value = params[:value]
	@username = params[:username]
	@phone = params[:phone]
	@datetime = params[:datetime]

	f = File.open './public/users.txt', 'a'
	f.write "User: #{@username}, Phone: #{@phone}, Date and time: #{@datetime}, Your barber: #{@value} "
	f.close
	erb :visit
end

post '/contacts' do
	@email = params[:email]

	f = File.open './public/users.txt', 'a'
	f.write "Email: #{@email} "
	f.close
	erb :contacts
end