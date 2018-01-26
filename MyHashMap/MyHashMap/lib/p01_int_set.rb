require 'byebug'
class MaxIntSet
  attr_accessor :store
  def initialize(max)
    @store=[]
    @max = max
  end

  def insert(num)
    raise 'Out of bounds' if num > 50 || num < 0
    store << num
  end

  def remove(num)
    store.delete(num)
  end

  def include?(num)
    store.include?(num)
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  attr_accessor :store, :max
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @max = num_buckets
  end

  def insert(num)
    store[num % max] << num
  end

  def remove(num)
    store[num % max].delete(num)
  end

  def include?(num)
    store[num % max].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_accessor :count, :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0

  end

  def insert(num)
    resize! if count >= num_buckets

    return false if self.include?(num)
    self[num] << num
    @count += 1

  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    old_store = @store.flatten

    @store = Array.new(@store.length * 2) { Array.new }
    @count = 0
    old_store.each do |el|
      self.insert(el)
    end
  end
end
