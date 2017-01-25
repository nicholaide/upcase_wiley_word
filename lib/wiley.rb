class WileySquare
  require 'algorithms'
  require 'word_reader.rb' 
  
  =begin
    first implementation
    - read .lst file
    - only get words with certian length
    - do a push ("word", "word")
    - use wildcard to find matching words
  =end
  
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
    word_list = WorkReader.read_lines_with_word_size(@file_name, @word_size)
    if word_list.nil? or word_list.empty?
      return "Cannot find words with that size"
    elsif word_list.size < @word_size
      return "Not enough words to make a square of size #{@word_size}"
    end
    
    populate_trie(word_list)
  end
    
  private  
    def populate_trie(word_list)
      word_list.map { |w| @trie.push(w,w)}
    end

end