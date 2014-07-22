require 'mysql2'
require 'rubygems'
require 'bundler/setup'
require 'sinatra'


client = Mysql2::Client.new(:host => "localhost", :username => "root", :password => 'root') # "Database"
configure do
  set :views, "#{File.dirname(__FILE__)}/views"
end

enable :sessions
set :session_secret, 'randomesecretkey112324'

get '/home' do
erb :home
end

get '/show_databases' do               
@tasks = client.query("show databases;")
erb:show_databases
end   



get '/show_tables' do
db_name = params["database"]
client2 = Mysql2::Client.new(:host => "localhost", :username => "root", :password => 'root',:database => db_name )
@tables = client2.query("show tables;")
erb :show_tables
end

get '/show_table' do
table_name = params["table"]
db_name = params["database"]
client3 = Mysql2::Client.new(:host => "localhost", :username => "root", :password => 'root',:database => db_name )
@table = client3.query("Desc #{table_name}")
@table2 = client3.query("select * from #{table_name}")
erb :show_table
end



