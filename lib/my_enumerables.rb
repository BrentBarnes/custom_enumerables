module Enumerable

  def my_each_with_index
    return 'NBG' if !block_given?
  
    i = 0
    self.my_each do |element|
      yield element, i
      i += 1
    end
    self
  end

  def my_select
    return 'NBG' if !block_given?
    new_array = []
    self.my_each {|e| new_array << e if yield e}
    new_array
  end

  def my_all?
    return 'NBG' if !block_given?
    check = true
    
    self.my_each {|e| unless yield e then check = false end}
    check
  end

  def my_any?
    return 'NBG' if !block_given?
    check = false
    
    self.my_each {|e| if yield e then check = true end}
    check
  end

  def my_none?
    return 'NBG' if !block_given?
    check = true
    
    self.my_each {|e| if yield e then check = false end}
    check
  end

  def my_map
    return 'NBG' if !block_given?
    new_array = []
    
    self.my_each {|e| new_array << yield(e)}
    new_array
  end

  def my_count(variable = nil)
    counter = 0
  
    if variable != nil
      self.my_each {|e| if e == variable then counter += 1 end}  
    elsif !block_given?
      self.my_each {counter += 1}
    elsif block_given?
      self.my_each {|e| if yield e then counter += 1 end}
    end
    counter
  end

  def my_inject(variable = nil)
    sum = 0
    sum = variable if variable != nil
  
    self.my_each do |e|
      sum = yield sum, e
    end
    sum
  end

end 

class Array
  def my_each
    return self if !block_given?
    
      i = 0
      until self[i] == nil do
        yield(self[i])
        i += 1
      end
      self
  end
end
