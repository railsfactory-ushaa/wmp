require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require_relative 'todolist1.rb'

configure do
  set :views, "#{File.dirname(__FILE__)}/views"
end

enable :sessions
set :session_secret, 'randomsecretkey112324'
t = Todolist.new("p.txt")
# root page
get '/home' do
 
  erb :home
end  
get '/add' do
 erb :add

end
post '/add' do

items = params['items']
t.add(items)
t.save
t.list
erb :add
end
get '/pending' do

@str = []
@str = t.pending

erb :pending
end
get '/mark_done' do
 erb :mark_done

end
post '/mark_done' do
num = params['task'].to_i
t.complete(num)
t.save

erb :mark_done
end

get '/completed' do
@str1 = []
@str1 = t.completed
erb :completed
end
get '/delete' do
 erb :delete

end

post '/delete' do
num1 = params['delete'].to_i
 t.delete(num1)
t.save
erb :delete
end

