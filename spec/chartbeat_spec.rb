require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

HOST = 'fakehost.com'
KEY = 'fake_key'

describe "Chartbeat" do
  
  before :each do
    @c = Chartbeat.new :apikey => KEY, :host => HOST  
  end
  
  it "should get and parse the 'pages' endpoint" do
    register_uri("http://chartbeat.com/api/pages/", "pages")
    
    pages = @c.pages
    titles = pages['titles'].to_a
    titles[0][1].should eql('Talking Points Memo | Breaking News and Analysis')
  end
  
  it "should get and parse the 'pathsummary' endpoint" do
    register_uri("http://chartbeat.com/api/pathsummary/", "pathsummary")
    
    pathsummary = @c.pathsummary.to_a
    pathsummary[0][0].should eql('/2010/06/the_gaza_flotilla_raid_what_do_we_know.php')
  end
  
  it "should get and parse the 'recent' endpoint" do
    register_uri("http://chartbeat.com/api/recent/", "recent")
    
    recent = @c.recent
    recent[0]['i'].should eql('Talking Points Memo | Breaking News and Analysis')
  end
  
  it "should get and parse the 'summize' endpoint" do
    register_uri("http://chartbeat.com/api/summize/", "summize")
    
    summize = @c.summize
    summize['new'].should eql(40)
    summize['idle'].should eql(382)
  end

  it "should get and parse the 'quickstats' endpoint" do
    register_uri("http://chartbeat.com/api/quickstats/", "quickstats")
    
    quickstats = @c.quickstats
    quickstats['links'].should eql(730)
  end


  it "should get and parse the 'toppages' endpoint" do
    register_uri("http://chartbeat.com/api/toppages/", "toppages")
    
    toppages = @c.toppages
    toppages[0]['i'].should eql('Talking Points Memo | Breaking News and Analysis')
    toppages[0]['path'].should eql('/')
  end
  
  # Not implemented yet because chartbeat is returning blank arrays for this call
  it "should get and parse the 'alerts' endpoint"

  it "should get and parse the 'snapshots' endpoint" do
    register_uri("http://chartbeat.com/api/dashapi/snapshots/","snapshots")
    
    snapshots = @c.snapshots.to_a
    
    titles = snapshots[0]
    geo = snapshots[1]
    visitlength = snapshots[2]
    
    titles[1]['/2010/06/jon-stewart-barton-was-actually-reading-disdainful-asshle-digest-at-the-bp-hearings-video.php?ref=fpblg'].should eql ("Jon Stewart: Barton Was Actually Reading 'Disdainful Assh*le Digest' At The BP Hearings (VIDEO) | TPM LiveWire")
    geo[1]['countries']['US'].should eql(474)
    visitlength[1][0]['idle'].should eql(101.0)    
  end

  it "should get and parse the 'stats' endpoint" do
    register_uri("http://chartbeat.com/api/dashapi/stats/","stats")
    
    stats = @c.stats
    
    stats['read_min'].should eql(5)
    stats['people_max'].should eql(3742)
  end
  
  # Not implemented yet. Chartbeat is returning an error for this call at this time.
  it "should get and parse the 'data_series' endpoint"

  it "should get and parse the 'day_data_series' endpoint" do
    register_uri("http://chartbeat.com/api/dashapi/day_data_series/","day_data_series")
    
    day_data_series = @c.day_data_series.to_a
    day_data_series[0][0].should eql("/archives/2010/06/painfully_funny php")
  end

  it "should get and parse the 'histogram' endpoint" do
    register_uri("http://chartbeat.com/api/histogram/","histogram")
    
    histogram = @c.histogram
    histogram['n']['data']['sumOfSquares'].should eql(91.0)
  end

  it "should get and parse the 'summary' endpoint" do
    register_uri("http://chartbeat.com/api/summary/","summary")

    summary = @c.summary
    summary['n']['data']['sumOfSquares'].should eql(99.0)
  end
  
end
