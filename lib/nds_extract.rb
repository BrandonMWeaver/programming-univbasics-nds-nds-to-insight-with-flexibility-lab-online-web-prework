# Provided, don't edit
require 'directors_database'

# A method we're giving you. This "flattens"  Arrays of Arrays so: [[1,2],
# [3,4,5], [6]] => [1,2,3,4,5,6].

def flatten_a_o_a(aoa)
  result = []
  i = 0

  while i < aoa.length do
    k = 0
    while k < aoa[i].length do
      result << aoa[i][k]
      k += 1
    end
    i += 1
  end

  result
end

def movie_with_director_name(director_name, movie_data)
  { 
    :title => movie_data[:title],
    :worldwide_gross => movie_data[:worldwide_gross],
    :release_year => movie_data[:release_year],
    :studio => movie_data[:studio],
    :director_name => director_name
  }
end

# Your code after this point

def movies_with_director_key(name, movies_collection)
  aoh = []
  
  index = 0
  while index < movies_collection.size do
    aoh << { director_name: name, title: movies_collection }
    index += 1
  end
  
  return aoh
end

def gross_per_studio(collection)
  # GOAL: Given an Array of Hashes where each Hash represents a movie,
  # return a Hash that includes the total worldwide_gross of all the movies from
  # each studio.
  #
  # INPUT:
  # * collection: Array of Hashes where each Hash where each Hash represents a movie
  #
  # RETURN:
  #
  # Hash whose keys are the studio names and whose values are the sum
  # total of all the worldwide_gross numbers for every movie in the input Hash
  
  hash = {}
  total = 0
  
  index = 0
  while index < collection.size do
    total += collection[index][:worldwide_gross]
    hash[collection[index][:studio]] = collection[index][:worldwide_gross]
    index += 1
  end
  
  return hash
end

def movies_with_directors_set(source)
  aoa = []
  
  index = 0
  while index < source.size do
    temp = []
    
    i = 0
    while i < source[index][:movies].size do
      temp << { title: source[index][:movies][i][:title], director_name: source[index][:name], studio: source[index][:movies][i][:studio], worldwide_gross: source[index][:movies][i][:worldwide_gross] }
      i += 1
    end
    
    aoa << temp
    index += 1
  end
  
  return aoa
end

# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
