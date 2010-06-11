require 'httparty'

class Chartbeat
  include HTTParty
  
  base_uri 'chartbeat.com/api'   
  format :json
  
  # Chartbeat.new :apikey => 'yourkey', :host => 'yourdomain.com'
  def initialize(opts = {})
    self.class.default_params :apikey => opts[:apikey]
    self.class.default_params :host => opts[:host]
  end
  
  #
  # real-time calls
  #
  
  def pages(path = nil)
    self.class.get("/pages/", :query => {:path => path})
  end
  
  def pathsummary(opts = {})
    q = { :keys => 'n',
          :types => 'n'
        }.merge!(opts)
    
    self.class.get("/pathsummary/", :query => q)
  end
  
  def recent(opts = {})
    q = { :limit => nil,
          :path => '/' 
         }.merge!(opts)
    
    self.class.get("/recent/", :query => q)
  end
  
  def summize(path = nil)
    self.class.get("/summize/", :query => {:path => path})
  end
  
  def toppages(limit = nil)
    self.class.get("/toppages/", :query => {:limit => limit})
  end
  
  #
  # historical calls
  #
  
  #defaults to yesterday
  def alerts(since = (Time.now.to_i - 86400))
    self.class.get("/dashapi/alerts/", :query => {:since => since})
  end
  
  def snapshots(timestamp = Time.now.to_i)
  
  end
  
  def stats
    self.class.get("/dashapi/stats/")
  end
  
  def data_series(opts = {})
    { :timestamp => Time.now.to_i - 86400,
      :days => 1,
      :minutes => 20,
      :type => 'path',
      :val => nil
    }.merge!(opts)
    
    self.class.get("/dashapi/data_series/", :query => {}.merge!(opts))
  end
  
  def day_data_series(opts = {})
    { :timestamp => Time.now.to_i - 86400,
      :type => 'paths'
    }.merge!(opts)
   
   self.class.get("/dashapi/day_data_series/", :query => {}.merge!(opts)) 
  end
  
  #
  # other calls
  #
  
  def histogram(opts = {})
    { :keys => '',
      :breaks => '',
      :path => nil
    }.merge!(opts)
  
  end
  
  def summary(opts = {})
    { :keys => 'n',
      :types => 'n',
      :path => nil
    }.merge!(opts)
    
    self.class.get('/summary', :query => {}.merge!(opts))
  end
  
end