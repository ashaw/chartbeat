$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'rubygems'
require 'chartbeat'
require 'fakeweb'
require 'spec'
require 'spec/autorun'

FakeWeb.allow_net_connect = false

# aped from twitter gem
def fixture_file(filename)
  return "" if filename == ""
  file_path = File.expand_path(File.dirname(__FILE__) + "/fixtures/" + filename)
  File.read(file_path)
end

def register_uri(uri, method)
  query_string = "?breaks=n&type=path&types=n&path=%2F&since=#{Chartbeat::YESTERDAY}&limit=10&apikey=fake_key&timestamp=#{Chartbeat::YESTERDAY}&days=1&keys=n&minutes=20&host=fakehost.com"
  FakeWeb.register_uri(:get, "#{uri}#{query_string}", :body => fixture_file("#{method}.json"))
end

Spec::Runner.configure do |config| 
end
