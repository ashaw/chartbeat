require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

HOST = 'fakehost.com'
KEY = 'fake_key'

describe "Chartbeat" do
	
	before :each do
		@c = Chartbeat.new :apikey => KEY, :host => HOST	
	end
	
  it "should get and parse the 'pages' endpoint" do
		register_uri("http://chartbeat.com/api/pages/?apikey=#{KEY}&host=#{HOST}&path=", "pages")
		
		pages = @c.pages
		titles = pages['titles'].to_a
		titles[0][1].should eql('Talking Points Memo | Breaking News and Analysis')
  end
  
  it "should get and parse the 'pathsummary' endpoint"
  
  it "should get and parse the 'recent' endpoint" do
  	register_uri("http://chartbeat.com/api/recent/?apikey=#{KEY}&host=#{HOST}&path=%2F&limit=", "recent")
  	
  	recent = @c.recent
  	recent[0]['i'].should eql('Talking Points Memo | Breaking News and Analysis')
  end
  
  it "should get and parse the 'summize' endpoint" do
  	register_uri("http://chartbeat.com/api/summize/?apikey=#{KEY}&host=#{HOST}&path=%2F", "summize")
  	
  	summize = @c.summize
		summize['new'].should eql(40)
		summize['idle'].should eql(382)
  end

  it "should get and parse the 'toppages' endpoint"

  it "should get and parse the 'alerts' endpoint"

  it "should get and parse the 'snapshots' endpoint"

  it "should get and parse the 'stats' endpoint"

  it "should get and parse the 'data_series' endpoint"

  it "should get and parse the 'day_data_series' endpoint"

  it "should get and parse the 'histogram' endpoint"

  it "should get and parse the 'summary' endpoint"

end
