# Runtime: 2188 ms, faster than 7.83% of Ruby online submissions for LRU Cache.
# Memory Usage: 14.3 MB, less than 100.00% of Ruby online submissions for LRU Cache.
class LRUCache
  def initialize(capacity)
    @capacity = capacity
    @cache = {}
    @touch = {}
    @count = 0
  end

  def get(key)
    return -1 if @cache[key].nil?
    self.touch(key)
    @cache[key]
  end

  def touch(key)
    @count+=1
    @touch[key] = @count
  end

  def put(key, value)
    @cache[key] = value
    self.touch(key)
    self.del(rlu_key) if @cache.count > @capacity
  end

  def del(key)
    @cache.delete(key)
    @touch.delete(key)
  end

  def rlu_key
    lru = @touch.first
    @touch.each do |key, val|
      lru = [key, val] if val < lru.last
    end
    lru.first
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
