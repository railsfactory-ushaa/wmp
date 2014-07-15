require 'sinatra'
require'./roman.rb'
require './numbers.rb'
require './spell_digit.rb'


get '/hi' do
  "Hello World!"
end


get '/time' do
  Time.now.strftime("%d-%m-%Y %B %e %A")
end

get '/hello/:name' do
  "Hello #{params[:name]}!"
end

get '/html' do
  "
<html>  
  <head>
  <title>hello </title>
  </head>
  <body>
  <h1>hello world</h1>
  </body>
  
</html>  
  "
end


get '/page' do 
date  =   params['date']
month = params['month']
year = params['year']
page =    File.read('./form.html')
s = Roman.convert(year)
l = Numbers.convert(date)
c = Spell_digit.convert(year)

page =  page + ' ' + l + ' ' + month.to_s + ' ' + year.to_s + ' ' + s + ' ' + c  # unless name.nil?
end

get '/page2' do 
date  =   params['date']
page =    File.read('./form.html')
page.gsub( '#calender',date.to_s )
end
