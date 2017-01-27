class WileySquare
  require 'algorithms'
  require 'word_reader.rb' 
  
  EMPTY_LIST = "Unable to get info from dictionary".freeze
  NOT_ENOUGH = "Not enough words to work with".freeze  
  NO_SQUARE = "No square found".freeze  
  
     
#     first implementation
#     - read .lst file
#     - only get words with certian length
#     - do a push ("word", "word")
#     - use wildcard to find matching words

  
  def self.create_square(file_name, word_size)
    wiley = WileySquare.new(file_name, word_size)
    wiley.find_square
  end
  
  def initialize(file_name, word_size)
    @file_name = file_name
    @word_size = word_size
    @trie = Containers::Trie.new
  end

  def find_square
    # add check for minimum of two
    word_list = WordReader.read_words_with_size(@file_name, @word_size)
    if word_list.nil? or word_list.empty?
      return EMPTY_LIST
    elsif word_list.size < @word_size
      return NOT_ENOUGH
    end
    
    @word_list = word_list
    populate_trie()
    
    @word_list.each do |word|
      a_wiley_square =  construct_square_with(word) 
      if a_wiley_square.empty? || a_wiley_square.size < @word_size
        next
      else
        return a_wiley_square # probably need some formatting
      end
    end
    
    return NO_SQUARE
  end
    
  private  
  
  
# C A R D	
# A R E A
# R E A	R 
# D A R T	  
  
    def populate_trie
      @word_list.map { |w| @trie.push(w,w)}
    end
    
    # return empty array if cannot find a square
    # make this work for 3 letters first    
    def construct_square_with(starting_word)
      # find keys (words) that matches the second letter of the starting word_size
      
      # need to incorporate word_size here and check for size
      position = 2
      words_array = [starting_word]
      second_words = find_words_for_position(words_array, position)
      
      second_words.each |s_word|
        candidate_square = _construct_square_with(words_array.dup.concat(s_word), position + 1)
        return candidate_square if candidate_square.size == @word_size
        next
      end
      
      return []
    end
    
    # returns a complete square
    def _construct_square_with(word_array, position)
      possible_words = find_words_for_position(words_array, position)
      
      # need to check for size
      possible_words.each |p_word|
        candidate_square = _construct_square_with(words_array.dup.concat(s_word), position + 1)
      end
    end
    
    
    
    
    # find keys (words) for position 'pos' in the square
    # each position has its own logic for wilcard chars allowed 
    # ex. for 2nd words, need to be given first chars
    # ex. for 3rd words, need to be given chars in position 0, 1    
    def find_words_for_position(words_array, pos)
      index = pos - 1
      prefix = words.array.first[index])
      
      words_array[1..-1].each do |word|
        prefix.concat(word[index])
      end      
      
      return @trie.wildcard("#{prefix}#{'*' * (@word_size - index)}")
    end
    

end