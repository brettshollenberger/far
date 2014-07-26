require "spec_helper"

describe Fit::Replacer do
  before(:each) do
    @replacer  = Fit::Replacer.new 's/cats/dogs'
    @replacer2 = Fit::Replacer.new 's/Cool\:\:Guy/Cool\:\:Dude'
    @replacer3 = Fit::Replacer.new 's/Dr\.\(Escape\)[LOVE]*/weirdo'
  end

  it "accepts an Vim-like substitution argument" do
    expect(@replacer.substitution).to  eq('s/cats/dogs/')
    expect(@replacer2.substitution).to eq('s/Cool\:\:Guy/Cool\:\:Dude/')
    expect(@replacer3.substitution).to eq('s/Dr\.\(Escape\)[LOVE]*/weirdo/')
  end

  it "parses the 'find' argument" do
    expect(@replacer.find).to  eq('cats')
    expect(@replacer2.find).to eq('Cool\:\:Guy')
    expect(@replacer3.find).to eq('Dr\.\(Escape\)[LOVE]*')
  end

  it "parses the 'replace' argument" do
    expect(@replacer.replace).to  eq('dogs')
    expect(@replacer2.replace).to eq('Cool\:\:Dude')
    expect(@replacer3.replace).to eq('weirdo')
  end
end
