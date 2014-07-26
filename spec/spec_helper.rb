require "pry"
require "differ"

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[File.expand_path("./lib/**/*.rb")].each          { |f| puts f; require f }
Dir[File.expand_path("./spec/support/**/*.rb")].each { |f| require f }
