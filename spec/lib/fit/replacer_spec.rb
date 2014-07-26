require "spec_helper"

describe Fit::Replacer do
  before(:each) do
    @replacer  = Fit::Replacer.new 's/cats/dogs',                {:ignore_dir => "spec"}
    @replacer2 = Fit::Replacer.new 's/Cool\:\:Guy/Cool\:\:Dude', {:ignore_dir => "spec"}
  end

  it "accepts an Vim-like substitution argument" do
    expect(@replacer.substitution).to  eq('s/cats/dogs/')
    expect(@replacer2.substitution).to eq('s/Cool\:\:Guy/Cool\:\:Dude/')
  end

  it "parses the 'find' argument" do
    expect(@replacer.find).to  eq('cats')
    expect(@replacer2.find).to eq('Cool\:\:Guy')
  end

  it "parses the 'replace' argument" do
    expect(@replacer.replace).to  eq('dogs')
    expect(@replacer2.replace).to eq('Cool\:\:Dude')
  end

  it "gets file list" do
    expect(@replacer.file_list).to  eq ["example_files/cats.tirade"]
    expect(@replacer2.file_list).to eq ["example_files/everyone.rb", "example_files/people.rb"]
  end
end
