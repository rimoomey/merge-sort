# frozen_string_literal: false

def merge_sort(array)
  if array.length > 1
    left = array[0..(array.length / 2) - 1]
    right = array[(array.length / 2)..]
    left = merge_sort(left)
    right = merge_sort(right)
    array = merge(left, right)
  end
  array
end

def merge(left, right)
  l_index = 0
  r_index = 0
  merged = Array.new(left.length + right.length)
  m_index = 0

  while l_index < left.length && r_index < right.length
    if left[l_index] <= right[r_index]
      merged[m_index] = left[l_index]
      l_index += 1
    else
      merged[m_index] = right[r_index]
      r_index += 1
    end
    m_index += 1
  end
  l_index == left.length ? fill_end(merged, m_index, right, r_index) : fill_end(merged, m_index, left, l_index)
end

def fill_end(merged, m_index, left_over, left_over_index)
  while m_index < merged.length
    merged[m_index] = left_over[left_over_index]
    m_index += 1
    left_over_index += 1
  end
  merged
end


p merge_sort([0,1,5,9,3,2,5,-4])
