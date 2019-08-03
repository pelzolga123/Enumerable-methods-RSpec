# frozen_string_literal: true

module Enumerable
  def my_each
    i = 0
    while i < length
      yield(self[i])
      i += 1
    end
    self
  end

  def my_each_with_index
    i = 0
    while i < length
      yield(self[i], i)
      i += 1
    end
  end

  def my_select
    arr = []
    my_each do |e|
      arr.push(e) if yield(e)
    end
    arr
  end

  def my_all?
    my_each do |e|
      return false unless yield e
    end
    true
  end

  def my_any?
    my_each  do |e|
      if yield e
        return true
      else
        return false
      end
    end
  end

  def my_none?
    my_each do |e|
      return false if yield e
    end
    true
  end

  def my_count
    i = 0
    count = 0
    until i == size
      count += 1 if yield(self[i])
      i += 1
    end

    count
  end

  def my_map(proc = nil)
    arr = []
    if !proc.nil?
      my_each do |e|
        arr.push(proc.call(e))
      end
    else
      my_each do |e|
        arr.push(yield(e))
      end
    end
    arr
  end

  def my_inject(value = 0)
    my_each do |e|
      value = yield(value, e)
    end
    value
  end
end
