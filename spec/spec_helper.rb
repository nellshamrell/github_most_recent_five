Dir[File.join(File.dirname(__FILE__), "..", "lib" , "**.rb")].each do |f|
    require f
end

require 'octokit'
require 'webmock/rspec'

# pull in the VCR setup
require File.expand_path './support/vcr_setup.rb', __dir__


