require 'pry'

class Anagram

  attr_accessor :the_gram

  def initialize(the_gram)
    @the_gram = the_gram
  end

  def match(test_array)
    test_array.select do |word|
      word.split("").sort == @the_gram.split("").sort
    end
  end


end

