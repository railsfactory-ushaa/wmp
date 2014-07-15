require_relative '../lib/numbers'
require 'test/unit'


class TestNumbers < Test::Unit::TestCase



  def test_num
    assert_equal '1st',Numbers.convert(1)
    assert_equal '2nd',Numbers.convert(2)
    assert_equal '3rd',Numbers.convert(3)
    assert_equal '4th',Numbers.convert(4)
    assert_equal '15th',Numbers.convert(15)
    assert_equal '20th',Numbers.convert(20)
    assert_equal '21st',Numbers.convert(21)
    assert_equal '22nd',Numbers.convert(22)
    assert_equal '23rd',Numbers.convert(23)
    assert_equal '29th',Numbers.convert(29)
    assert_equal '30th',Numbers.convert(30)
    assert_equal '31st',Numbers.convert(31)
     
   
   
  end



end 
