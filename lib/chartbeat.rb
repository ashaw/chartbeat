require 'httparty'

class Chartbeat
  include HTTParty
  
  base_uri 'chartbeat.com/api'   
  format :json
  
  # c = Chartbeat.new :apikey => 'yourkey', :host => 'yourdomain.com'
  def initialize(opts = {})
    self.class.default_params :apikey => opts[:apikey]
    self.class.default_params :host => opts[:host]
  end
  
  #
  # real-time calls
  #
  
  # c.pages :path => '/'
  def pages(opts = {})
    q = { :path => nil
        }.merge!(opts)
        
    self.class.get("/pages/", :query => q)
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
  
  def summize(opts = {})
    q = { :path => '/'
        }.merge!(opts)
        
    self.class.get("/summize/", :query => q)
  end
  
  def toppages(opts = {})
    q = { :limit => nil
        }.merge!(opts)
        
    self.class.get("/toppages/", :query => q)
  end
  
  #
  # historical calls
  #
  
  YESTERDAY = Time.now.to_i - 86400
  
  #defaults to yesterday
  def alerts(opts = {})
    q = { :since => YESTERDAY 
        }.merge!(opts)
        
    self.class.get("/dashapi/alerts/", :query => q)
  end
  
  def snapshots(opts = {})
    q = { :timestamp => YESTERDAY
        }.merge!(opts)
        
    self.class.get("/dashapi/snapshots/", :query => q)
  end
  
  def stats
    self.class.get("/dashapi/stats/")
  end
  
  #NOT WORKING, "We're most likely pushing out some new changes."
  def data_series(opts = {})
    q = { :timestamp => YESTERDAY,
          :days => 1,
          :minutes => 20,
          :type => 'path',
          :val => nil
        }.merge!(opts)
    
    self.class.get("/dashapi/data_series/", :query => q)
  end
  
  def day_data_series(opts = {})
    q = { :timestamp => YESTERDAY,
          :type => 'paths'
        }.merge!(opts)
   
   self.class.get("/dashapi/day_data_series/", :query => q) 
  end
  
  #
  # other calls
  #
  
  # NOT WORKING ("invalid json string")
  def histogram(opts = {})
    q = { :keys => 'n',
          :breaks => 'n',
          :path => nil
        }.merge!(opts)
  
    self.class.get('/histogram', :query => q)
  end

  # NOT WORKING ("invalid json string")  
  def summary(opts = {})
    q = { :keys => 'n',
          :types => 'n',
          :path => nil
        }.merge!(opts)
    
    self.class.get('/summary', :query => q)
  end
  
end