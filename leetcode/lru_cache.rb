# Runtime: 580 ms, faster than 14.46% of Ruby online submissions for LRU Cache.
# Memory Usage: 14.4 MB, less than 100.00% of Ruby online submissions for LRU Cache.
class LRUCache
  def initialize(capacity)
    @capacity = capacity
    @cache = {}
    @touch = {}
    @touch_count = 0
    @full = false
  end

  def get(key)
    return -1 if @cache[key].nil?
    self.touch(key)
    @cache[key]
  end

  def touch(key)
    @touch_count+=1
    @touch[key] = @touch_count
  end

  def put(key, value)
    not_found = @cache[key].nil?
    @cache[key] = value
    self.touch(key)
    if (not_found and @full)
      self.del(lru_key)
    elsif not_found
      @full = @cache.count > @capacity
      self.del(lru_key) if @full
    end
  end

  def del(key)
    @cache.delete(key)
    @touch.delete(key)
  end

  def lru_key
    lru = @touch.first
    @touch.each do |key, val|
      lru = [key, val] if val < lru.last
    end
    lru.first
  end
end

# since Ruby Hash maintains the insertion order
# Runtime: 240 ms, faster than 18.07% of Ruby online submissions for LRU Cache.
# Memory Usage: 14.5 MB, less than 100.00% of Ruby online submissions for LRU Cache.
class LRUCache
  def initialize(capacity)
    @capacity = capacity
    @cache = {}
    @full = false
  end

  def get(key)
    return -1 if @cache[key].nil?
    self.touch(key)
    @cache[key]
  end

  def touch(key, value = nil)
    value = @cache[key] if value.nil?
    @cache.delete(key)
    @cache[key] = value
  end

  def put(key, value)
    not_found = @cache[key].nil?
    self.touch(key, value)
    if (not_found and @full)
      @cache.shift
    elsif not_found
      @full = @cache.count > @capacity
      @cache.shift if @full
    end
  end
end

cache = LRUCache.new(2)
cache.put(1, 1)
cache.put(2, 2)
puts cache.get(1)       # returns 1
cache.put(3, 3)    # evicts key 2
puts cache.get(2)       # returns -1 (not found)
cache.put(4, 4)    # evicts key 1
puts cache.get(1)       # returns -1 (not found)
puts cache.get(3)       # returns 3
puts cache.get(4)       # returns 4