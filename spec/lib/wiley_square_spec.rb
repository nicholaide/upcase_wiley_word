require_relative "../../lib/wiley_square.rb"

describe "WileySquare" do
  # should I be able to stub or mock the return of reader? I don't want to test the functionality of WordReader,
  # but that it knows if the word_list is empty, nil, or of insufficient size
  
  it "returns the correct error message when word_list is empty or nil" do
    # using stubs
    allow(WordReader).to receive(:read_words_with_size).with("some_list.lst", 99).and_return(nil)
    wiley = WileySquare.create_square("some_list.lst", 99)

    expect(wiley).to eq(WileySquare::EMPTY_LIST)
    
    allow(WordReader).to receive(:read_words_with_size).with("some_list.lst", 99).and_return(Array.new)
    wiley = WileySquare.create_square("some_list.lst", 99)
    
    expect(wiley).to eq(WileySquare::EMPTY_LIST)
            
  end
  
  it "returns the correct error message when word_list does not have enough words" do
   #puts  WileySquare::EMPTY_LIST
  end
  
end