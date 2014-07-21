require 'mysql2'
require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require './todolist1.rb'

client = Mysql2::Client.new(:host => "localhost", :username => "root", :password => 'root', :database => "usha3")
configure do
  set :views, "#{File.dirname(__FILE__)}/views"
end

enable :sessions
set :session_secret, 'randomesecretkey112324'

get '/home' do
erb :home
end  
get '/add' do
erb :add
end
post '/add' do
task = params["items"]
results = client.query("insert into todolist(task,status) values('#{task}' , 'pending')")
erb:add
end
get '/pending' do               
@tasks = client.query("select * from todolist where status='pending'")
erb:pending
end   

get '/completed' do         
@completed_tasks = client.query("select * from todolist where status='completed'")
erb:completed
end

get '/mark_done' do
@tasks = client.query("select * from todolist where status='pending'")
erb:mark_done
end
post '/mark_done' do
n = params["item1"].to_i
results = client.query("update todolist set status='completed' where sl_no='#{n}'")
#@tasks = client.query("select * from todolist where status='pending'")
erb:mark_done
end
get '/delete' do
@tasks = client.query("select * from todolist where status='completed'")
erb:delete
end
post '/delete' do
n1 = params["item2"].to_i           
@r = client.query("delete from todolist where sl_no='#{n1}'")
#@tasks = client.query("select * from todolist where status='completed'")
erb:delete
end
