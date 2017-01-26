require_relative "../../lib/wiley_square.rb"

describe "WileySquare" do
  # should I be able to stub or mock the return of reader? I don't want to test the functionality of WordReader,
  # but that it knows if the word_list is empty, nil, or of insufficient size
  
  it "returns the correct error message when word_list is empty or nil" do
    # using stubs
    allow(WordReader).to receive(:read_words_with_size).with("some_list.lst", 99).and_return(nil)
    wiley = WileySquare.create_square("some_list.lst", 99)

    wiley = WileySquare.create_square("some_list.lst", 99)
    
    allow(WordReader).to receive(:read_words_with_size).with("some_list.lst", 99).and_return(Array.new)
    wiley = WileySquare.create_square("some_list.lst", 99)
    
    expect(wiley).to eq(WileySquare::EMPTY_LIST)
            
  end
  
  it "returns the correct error message when word_list does not have enough words" do
  # using stubs
   allow(WordReader).to receive(:read_words_with_size).with("some_list.lst", 4).and_return(["john", "jean"])
   wiley = WileySquare.create_square("some_list.lst", 4)
   
   expect(wiley).to eq(WileySquare::NOT_ENOUGH)
  end
  
  
  # B I T
  # I C E
  # T E A
  
  it "returns an error message if a square can't be found" do
    allow(WordReader).to receive(:read_words_with_size).with("some_list.lst", 3).and_return(["ice", "bit", "him"])
    wiley = WileySquare.create_square("some_list.lst", 3)
    
    expect(wiley).to eq(WileySquare::NO_SQUARE)
  end
  
  it "returns an array of words if square can be formed" do
    allow(WordReader).to receive(:read_words_with_size).with("some_list.lst", 3).and_return(["bit", "ice", "tea"])
    wiley = WileySquare.create_square("some_list.lst", 3)
    
    expect(wiley).to eq(["bit", "ice", "tea"])
  end  
  
end