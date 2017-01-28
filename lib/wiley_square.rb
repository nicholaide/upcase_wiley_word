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
      if a_wiley_square.size < @word_size
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
      
      words_array = [starting_word]
      return _construct_square_with(words_array, 2)
    end
    
    # returns a complete square
    def _construct_square_with(words_array, position)
      possible_words = find_words_for_position(words_array, position)
      
      if position == @word_size and !possible_words.empty?
        return words_array.concat([possible_words.first]) # we found a square!
      elsif possible_words.empty?
        return words_array # return an incomplete square
      else
        possible_words.each do |p_word|
          temp_array = words_array.dup.concat([p_word])          
          if check_trie(temp_array, position)
            candidate_square = _construct_square_with(temp_array, position + 1) 
            return candidate_square if candidate_square.size == @word_size
          end
          next
        end 
      end
      
      return words_array # return an incomplete square
    end
    
        
    # find keys (words) for position 'pos' in the square
    # each position has its own logic for wilcard chars allowed 
    # ex. for 2nd words, need to be given first chars
    # ex. for 3rd words, need to be given chars in position 0, 1    
    def find_words_for_position(words_array, pos)
      index = pos - 1
      prefix = words_array.first[index]
      
      words_array[1..-1].each do |word|
        prefix.concat(word[index])
      end      
      
      return @trie.wildcard("#{prefix}#{'*' * (@word_size - index)}")
    end
    
    # check the words so far for viability of adding more words to form a square
    # postion is the last position filled
    # for example, if [CARD, AREA] are in words, need to check trie for words 
    # that start with RE** and DA** for a 4-word square
    def check_trie(words, position)
      wildcards = "*" * (@word_size - position)
      
      (position...@word_size).each do |c| 
        # get the chars from each word for each position, concat them, and test the trie
        prefix = ""
        words.each do |word|
          prefix.concat(word[c])
        end
        return false if @trie.wildcard("#{prefix}#{wildcards}").empty?
      end
      
      return true
    end
    

end