class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    hash_value = 0
    self.each_with_index do |el,idx|
      # if el.is_a?(Array)
      #   hash_value += el.hash
      # else
        hash_value += (el.hash) * idx
    end
    hash_value
  end
end

class String
  def hash
    self.chars.map{|chr| ('a'..'z').to_a.index(chr)}.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    self.sort.map{|el| el[0]}.hash +
    self.sort.map{|el| el[1]}.hash
  end
end
