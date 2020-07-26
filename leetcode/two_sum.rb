# Runtime: 32 ms, faster than 95.31% of Ruby online submissions for Two Sum.
# Memory Usage: 10.3 MB, less than 5.68% of Ruby online submissions for Two Sum.
def two_sum(nums, target)
  indexes = {}
  nums.each_with_index do |num, i|
    compliment = target - num
    return [indexes[compliment], i] if !indexes[compliment].nil?
    indexes[num] = i
  end
end

nums = [2,7,11,15]
target = 9
puts two_sum(nums, target).to_s