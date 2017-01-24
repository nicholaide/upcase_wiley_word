class WileySquare
  require 'algorithms'
  require 'word_read.rb' 
  
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
    populate_trie(word_list) unless word_list.empty?
  end
    
  private  
    def populate_trie
      
    end

end