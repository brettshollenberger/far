require "spec_helper"

describe Far::Replacer do
  before(:each) do
    @replacer  = Far::Replacer.new 's/cats/dogs',                {:ignore_dir => "spec"}
    @replacer2 = Far::Replacer.new 's/Cool\:\:Guy/Cool\:\:Dude', {:ignore_dir => "spec",
                                                                  :please     => true,
                                                                  :replace    => true}
  end

  it "accepts a Vim-like substitution argument" do
    expect(@replacer.substitution).to  eq('s/cats/dogs/')
    expect(@replacer2.substitution).to eq('s/Cool\:\:Guy/Cool\:\:Dude/')
  end

  it "parses the 'find' argument" do
    expect(@replacer.find).to  eq('cats')
    expect(@replacer2.find).to eq('Cool\:\:Guy')
  end

  it "parses the 'replace' argument" do
    expect(@replacer.replace).to  eq('cats')
    expect(@replacer2.replace).to eq('Cool\:\:Dude')
  end

  it "gets file list" do
    expect(@replacer.file_list).to  eq ["example_files/cats.tirade"]
    expect(@replacer2.file_list).to eq ["example_files/everyone.rb", "example_files/people.rb"]
  end

  it "gets file list" do
    expect(@replacer.file_list).to  eq ["example_files/cats.tirade"]
    expect(@replacer2.file_list).to eq ["example_files/everyone.rb", "example_files/people.rb"]
  end

  it "is dry run if --please --replace not passed" do
    expect(@replacer.dry_run?).to  be true
    expect(@replacer2.dry_run?).to be false
  end

  it "is run if --please --replace is passed" do
    expect(@replacer.run?).to  be false
    expect(@replacer2.run?).to be true
  end
end
