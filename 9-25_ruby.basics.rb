# Download this file:
# https://gist.github.com/aviflombaum/28534c5d69edd2439a7d/download

# Run it from your terminal with: 
# ruby ruby.basics.rb
# (Just make sure you are in the right directory)

# ======================================
# Ignore All This Code
# ======================================

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

# 1. 
test 'that ruby has a concept of truth' do 
  assert true
end

# 2. 
test 'that ruby knows math' do
  assert_equal 42, 6*7
end

# 3. 
test 'that ruby can remember values with variables' do
  the_number_one = 1

  assert_equal the_number_one, 1 
end

# 4. 
test 'that ruby variables are references to values' do
  original = 1
  reference = original

  original = 2

  assert_equal reference, 1
end

# 5. 
test 'that ruby has methods' do
  
  class Object
    def defined_method
    end
  end

  assert respond_to?(:defined_method)
end

# 6. 
test 'that ruby methods can accept arguments' do
  def work(adjective)
    assert_equal adjective, "hard"
  end

  work("hard")
end

# 7. 
test 'that ruby methods can accept multiple arguments' do
  def a_method_with(two, arguments)
    two
    arguments
  end

  assert a_method_with("two", "arguments")
end

# 8. 
test 'that ruby methods return values' do
  def be
    'Nice'
  end

  assert_equal be, "Nice"
end

# 9. 
test 'that return values are always the last line of code' do
  def learning
    "beginner"
    "expert"
  end

  assert_equal learning, 'expert'
end

# 10.
test 'that method arguments can also be optional' do
  def keep(state = "calm")
    state
  end

  assert_equal keep, "calm"
end