require "spec_helper"

describe Fit::Options do
  before(:each) do
    @options  = Fit::Options.new({:ignore_dir => "spec", :c => true})
  end

  it "parses the options" do
    expect(@options.to_command_line).to eq('--ignore-dir=spec -c')
  end
end
