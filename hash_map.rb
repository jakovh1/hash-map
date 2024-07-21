# frozen_string_literal: true

# Class representing a Hash map.
#
# This class provides methods to:
# - insert new or overwrite existing key-value pair
# - retrieve a value corresponding to a provided key
# - check whether hashmap contains provided key
# - remove a key-value pair
# - clear the entire hashmap
# - retrieve all keys, values and key-value pairs
class HashMap
  attr_reader :length

  def initialize
    @length = 0
    @buckets = Array.new(16)
    @load_factor = 0.75
  end

  # Method to insert new or overwrite existing key-value pair:
  def set(key, value)

    # 1. Check whether the provided key already exists in a hashmap, if yes -> overwrite
    current = overwrite?(key)

    if current
      current.value = value
      return current
    end

    # 2. Check if adding new pair would exceed the threshold, if yes -> resize
    if (@length + 1) > (@buckets.length * @load_factor).round
      resize
    end

    # 3. Check if corresponding bucket is empty, if yes -> Add a new key-value pair
    bucket = hash(key) % @buckets.length
    current = @buckets[bucket]

    if current.nil?
      @buckets[bucket] = Node.new(key, value)
      @length += 1
      return @buckets[bucket]
    end

    
    @length += 1

    # 4. If correspnding bucket is not empty -> Link the new key-value pair to the last element of the bucket
    current = current.next_node until current.next_node.nil?
    current.next_node = Node.new(key, value)
  end

  # Method to retrieve a value corresponding to a provided key
  def get(key)
    bucket = hash(key) % @buckets.length
    current = @buckets[bucket]

    while current
      return current.value if current.key == key

      current = current.next_node
    end

    nil
  end

  # Method to check whether hashmap contains provided key
  def has?(key)
    bucket = hash(key) % @buckets.length
    current = @buckets[bucket]

    while current
      return true if current.key == key

      current = current.next_node
    end

    false
  end

  # Method to remove a key-value pair
  def remove(key)
    bucket = hash(key) % @buckets.length
    current = @buckets[bucket]
    previous = nil
    return_value = nil

    while current
      if current.key == key
        return_value = current.value
        if previous.nil?
          @buckets[bucket] = nil
        else
          previous.next_node = current.next_node
        end
        break
      end
      previous = current
      current = current.next_node
    end

    @length -= 1
    return_value
  end

  # Method to clear the entire hashmap
  def clear
    @buckets.map! { nil }
    @length = 0
  end

  def keys
    result = []
    @buckets.each do |bucket|
      while bucket
        result.push(bucket.key)
        bucket = bucket.next_node
      end
    end

    result
  end

  def values
    result = []
    @buckets.each do |bucket|
      while bucket
        result.push(bucket.value)
        bucket = bucket.next_node
      end
    end

    result
  end

  def entries
    result = []
    @buckets.each do |bucket|
      while bucket
        result.push([bucket.key, bucket.value])
        bucket = bucket.next_node
      end
    end

    result
  end

  private

  # Method to hash a given key
  def hash(key)
    hash_code = 0
    prime_number = 31
       
    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }
       
    hash_code
  end

  # Method that checks whether there is an existing key to overwrite its value
  def overwrite?(key)
    bucket = hash(key) % @buckets.length
    current = @buckets[bucket]

    while current
      return current if current.key == key

      current = current.next_node
    end

    nil
  end

  # Method that resizes buckets array
  def resize
    new_buckets = Array.new(@buckets.length * 2)
    @buckets.each do |bucket|

      while bucket

        new_bucket = hash(bucket.key) % new_buckets.length
        current = new_buckets[new_bucket]

        if current.nil?
          new_buckets[new_bucket] = Node.new(bucket.key, bucket.value)
        else
          current = current.next_node until current.next_node.nil?
          current.next_node = Node.new(bucket.key, bucket.value)
        end

        bucket = bucket.next_node
      end
    end
    
    @buckets = new_buckets.dup
  end

end