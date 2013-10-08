require 'pry'

class SecretHandshake

  # make an array of 5 nils
  # fill it from right to left.
  # starting from the right, go across the array to the left,
  # noting if a zero or one and checking what that space translates to

  def initialize(code_string)
    @code_string = code_string
  end

  def parse_to_array
    string_as_array = @code_string.split("")
    code_array = [nil,nil,nil,nil,nil]
    string_as_array.each do |bin|
      code_array.push(bin)
    end
    while code_array.size > 5
      code_array.delete_at(0)
    end
    # The above six lines can probably be replaced by a single method
    # that replaces items in the array. or a loop w/ iterator.

    code_array
  end

  def commands
    commands_result = []
    reverse = false
    self.parse_to_array.reverse.each_with_index do |bin, position|
      if bin == "1"
        case position+1
        when 1
          commands_result << "wink"
        when 2
          commands_result << "double blink"
        when 3
          commands_result << "close your eyes"
        when 4
          commands_result << "jump"
        when 5
          reverse = true
        end
      end
    end
    if reverse
      commands_result.reverse
    else
      commands_result
    end
  end

end

binding.pry

# 1 = wink
# 10 = double blink
# 100 = close your eyes
# 1000 = jump
 
 
# 10000 = Reverse the order of the operations in the secret handshake.