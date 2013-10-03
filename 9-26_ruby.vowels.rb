@tests = 0
 
def test(title, &b)
  @tests += 1
  begin
    if b
      result = b.call
      if result.is_a?(Array)
        puts "#{@tests}. fail: #{title}"
        puts "      expected #{result.first} to equal #{result.last}"
      elsif result
        puts "#{@tests}. pass: #{title}"
      else
        puts "#{@tests}. fail: #{title}"
      end
    else
      puts "#{@tests}. pending: #{title}"
    end
  rescue => e
    puts "fail: #{title}"
    puts e
  end
end
 
def assert(statement)
  !!statement
end
 
def assert_equal(actual, expected)
  if expected == actual
    true
  else
    [expected, actual]
  end
end
 
class Object
  def __
    puts "__ should be replaced with a value or expression to make the test pass."
    false
  end
end
 
# ======================================
# Start Here - Make these tests pass.
# ======================================
 
# Define a method named is_a_vowel? that takes one
# argument and returns true or false depending on
# whether the argument is a vowel.
 
# Method definition goes here:
 
def is_a_vowel?(arg)
  vowels = "aeiou"
  if vowels.include? arg
    true
  else
    false
  end
end

# you can use == to compare a string to another string
# and check for equality.
# 1. 
test 'that "a" is a vowel' do 
  
  assert is_a_vowel?("a")  
end
 
# 2. 
test 'that "e" is a vowel' do 
  
  assert is_a_vowel?("e")  
end
 
# 3. 
test 'that "i" is a vowel' do 
  
  assert is_a_vowel?("i")  
end
 
 
# 4. 
test 'that "o" is a vowel' do 
  
  assert is_a_vowel?("o")  
end
 
# 5. 
test 'that "u" is a vowel' do 
  
  assert is_a_vowel?("u")  
end
 
 
# 6. 
test 'that "b" is not a vowel' do 
  
  assert !is_a_vowel?("b")  
end
 
# 7. 
test 'that "c" is not a vowel' do 
  
  assert !is_a_vowel?("c")  
end