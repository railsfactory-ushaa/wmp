class Numbers

  def self.convert(number)
   number = number.to_i
    a1 = [1,21,31]
    a2 = [2,22]
    a3 = [3,23]
    a4 = [4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,24,25,26,27,28,29,30]
    if a1.include?(number)
    "#{number.to_i}st"
    elsif a2.include?(number)
     "#{number.to_i}nd"
    elsif a3.include?(number)
     "#{number.to_i}rd"
    else "#{number.to_i}th"
    end
    
  
  end

end 
