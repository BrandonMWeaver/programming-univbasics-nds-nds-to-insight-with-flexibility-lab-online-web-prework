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
  hash = {}
  totals = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
  
  index = 0
  while index < collection.size do
    case collection[index][:studio]
    
    when "Alpha Films"
      totals[13] += collection[index][:worldwide_gross]
      hash[collection[index][:studio]] = totals[13]
      
    when "Buena Vista"
      totals[0] += collection[index][:worldwide_gross]
      hash[collection[index][:studio]] = totals[0]
      
    when "Columbia"
      totals[1] += collection[index][:worldwide_gross]
      hash[collection[index][:studio]] = totals[1]
      
    when "Dreamworks"
      totals[2] += collection[index][:worldwide_gross]
      hash[collection[index][:studio]] = totals[2]
      
    when "Focus"
      totals[3] += collection[index][:worldwide_gross]
      hash[collection[index][:studio]] = totals[3]
      
    when "Fox"
      totals[4] += collection[index][:worldwide_gross]
      hash[collection[index][:studio]] = totals[4]
      
    when "MGM"
      totals[5] += collection[index][:worldwide_gross]
      hash[collection[index][:studio]] = totals[5]
      
    when "Miramax"
      totals[6] += collection[index][:worldwide_gross]
      hash[collection[index][:studio]] = totals[6]
      
    when "Omega Films"
      totals[14] += collection[index][:worldwide_gross]
      hash[collection[index][:studio]] = totals[14]
      
    when "Paramount"
      totals[7] += collection[index][:worldwide_gross]
      hash[collection[index][:studio]] = totals[7]
      
    when "Sony"
      totals[8] += collection[index][:worldwide_gross]
      hash[collection[index][:studio]] = totals[8]
      
    when "TriStar"
      totals[9] += collection[index][:worldwide_gross]
      hash[collection[index][:studio]] = totals[9]
      
    when "Universal"
      totals[10] += collection[index][:worldwide_gross]
      hash[collection[index][:studio]] = totals[10]
      
    when "Warner Brothers"
      totals[11] += collection[index][:worldwide_gross]
      hash[collection[index][:studio]] = totals[11]
      
    when "Weinstein"
      totals[12] += collection[index][:worldwide_gross]
      hash[collection[index][:studio]] = totals[12]
      
    end
    
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
