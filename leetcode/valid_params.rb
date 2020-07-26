# Runtime: 28 ms, faster than 98.40% of Ruby online submissions for Valid Parentheses.
# Memory Usage: 9.7 MB, less than 7.14% of Ruby online submissions for Valid Parentheses.
def is_valid(str)
  stack = []
  keys = {')'=>'(', ']'=>'[', '}'=>'{'}
  count = 0
  str.each_char do |paranthisis|
    if keys[paranthisis].nil?
      count+=1
      stack.push(paranthisis)
    else
      count-=1
      return false if count < 0 or !stack.pop.eql?(keys[paranthisis])
    end
  end
  return count==0
end

# Runtime: 44 ms, faster than 45.69% of Ruby online submissions for Valid Parentheses.
# Memory Usage: 9.6 MB, less than 7.14% of Ruby online submissions for Valid Parentheses.
# def is_valid(str)
#   stack = []
#   keys = {')'=>'(', ']'=>'[', '}'=>'{'}
#   str.each_char do |paranthisis|
#     if keys[paranthisis].nil?
#       stack.push(paranthisis)
#     else
#       return false if !stack.pop.eql?(keys[paranthisis])
#     end
#   end
#   return stack.empty?
# end

inputs = ["([)]", "(({})[])", '[', '()', "[([]])"]
inputs.each { |i| puts("#{i} - #{is_valid(i)}")}
