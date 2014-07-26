require "spec_helper"

describe Fit::Replacer do
  before(:each) do
    @replacer = Fit::Replacer.new 's/cats/dogs'
  end

  it "accepts an Vim-like substitution argument" do
    expect(@replacer.substitution).to eq('s/cats/dogs')
  end

  it "parses the 'find' argument" do
    expect(@replacer.find).to eq('cats')
  end
end
