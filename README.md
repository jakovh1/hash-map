# HashMap

## Description
A Ruby implementation of the HashMap data structure.

## Installation
1. Ensure Ruby is installed on your system
2. Clone the repository
  ```bash 
    git clone https://github.com/jakovh1/hash-map
  ```
3. Navigate to the project directory 
  ```bash
    cd hash-map
  ```
4. Load neccessary ruby files within irb
  ```bash
    irb -r ./hash_map -r ./node
  ```
5. Create HashMap instance and store it to a variable
  ```bash
    my_hashmap = HashMap.new
  ```
## Available HashMap Instance Methods
  1. #set(key, value) - Inserts new or overwrites existing key-value pair, takes two arguments, the first is a key and the second is a value that is assigned to this key. If a key already exists, then the old value is overwritten.
  2. #get(key) - takes one argument as a key and returns the value that is assigned to this key. If key is not found, return nil.
  3. #has?(key) - takes a key as an argument and returns true or false based on whether or not the key is in the hash map.
  4. #remove(key) - takes a key as an argument. If the given key is in the hash map, it should remove the entry with that key and return the deleted entry’s value. If the key isn’t in the hash map, it should return nil.
  5. #length - returns the number of stored keys in the hash map.
  6. #clear - removes all entries in the hash map.
  7. #keys - returns an array containing all the keys inside the hash map.
  8. #values - returns an array containing all the values.
  9. #entries - returns an array that contains each key, value pair. 

## Usage without Installation on your local machine
Run the game on [Replit](https://replit.com/@1jakov1horvat/hash-map)