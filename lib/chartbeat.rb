require 'crack'
require 'rest_client'

class Chartbeat
  YESTERDAY         = Time.now.to_i - 86400
  BASE_URI          = 'chartbeat.com/api'
  METHODS           = [:pages, :pathsummary, :recent, :summize, :toppages, :histogram, :summary]
  DASHAPI_METHODS   = [:alerts, :snapshots, :stats, :data_series, :day_data_series]
  DEFAULT_ARG_VALS  = {:path => '/', :keys => 'n', :types => 'n', :since => YESTERDAY, 
                       :timestamp => YESTERDAY, :days => 1, :minutes => 20, :type => 'path', 
                       :breaks => 'n', :limit => 10}

  # c = Chartbeat.new :apikey => 'yourkey', :host => 'yourdomain.com'
  def initialize(opts = {})
    raise RuntimeError, "You must provide an API key and host" unless opts[:apikey] && opts[:host]
    @apikey = opts[:apikey]
    @host = opts[:host]
  end
    
  def method_missing(m, *args)
    super unless METHODS.include?(m) || DASHAPI_METHODS.include?(m)
    
    query = *args
    query_to_perform = {:apikey => @apikey, :host => @host}
    DEFAULT_ARG_VALS.each do |k,v|
      if query && query[k]
        v = query[k]
      end
      query_to_perform[k] = v
    end
    prefix = DASHAPI_METHODS.include?(m) ? '/dashapi' : ''
    data = Crack::JSON.parse(RestClient.get("http://" + BASE_URI + prefix + '/' + m.to_s + '/', :params => query_to_perform))
  end
    
end