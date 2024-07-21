# frozen_string_literal: true

require_relative './node'
require_relative './hash_map'

test = HashMap.new
test.set('apple', 'red')
test.set('banana', 'yellow')
test.set('carrot', 'orange')
test.set('dog', 'brown')
test.set('elephant', 'gray')
test.set('frog', 'green')
test.set('grape', 'purple')
test.set('hat', 'black')
test.set('ice cream', 'white')
test.set('jacket', 'blue')
test.set('kite', 'pink')
test.set('lion', 'golden')

p test.get('kite')
p test.set('kite', 'black')
p test.get('kite')
p test.set('ice cream', 'red')
p test.get('ice cream')
p test.set('grape', 'darkblue')
p test.get('grape')
test.set('moon', 'silver')
p test.get('moon')
p test.keys
p test.values
p test.entries
p test.length
p test.has?("lion")
p test.has?("grape")
p test.has?("dog")
p test.has?("carrot")
p test.has?("apple")
p test.remove('grape')
p test.has?("grape")
test.clear
p test.entries

test.set('apple', 'red')
test.set('banana', 'yellow')
test.set('carrot', 'orange')
test.set('dog', 'brown')
test.set('elephant', 'gray')
test.set('frog', 'green')
test.set('grape', 'purple')
test.set('hat', 'black')
test.set('ice cream', 'white')
test.set('jacket', 'blue')
test.set('kite', 'pink')
test.set('lion', 'golden')
p test.entries