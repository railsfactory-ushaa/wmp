require 'sinatra'
require './roman.rb'
require './numbers.rb'
require './spell_digit.rb'
require './kan1.rb'





get '/page' do 
date  =   params['date'].to_i
month = params['month'].to_i
year = params['year'].to_i
page =    File.read('./form.html')
s = Roman.convert(year)
l = Numbers.convert(date)
c = Spell_digit.convert(year)
x = ""
if date !=0 && month!=0 && year!=0
t = Time.new(year,month,date)
x = t.strftime ('%A')
a = Kannada.convert(x)
end

                          
page =  page + ' ' + l + ' ' + month.to_s + ' ' + year.to_s + ' ' + s + ' ' + c + ' ' + x + ' '+ a.to_s

end



