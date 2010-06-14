# chartbeat

A Ruby wrapper for the [Chartbeat API](http://chartbeat.pbworks.com)

## Install

`gem install chartbeat`

## Usage

    c = Chartbeat.new :apikey => 'yourkey', :host => 'yourdomain.com'    
    
real-time calls and options

    c.pages            :path => '/'
    c.pathsummary      :keys => 'n', :types => 'n'
    c.recent           :limit => 2, :path => '/'
    c.summize          :path => '/'
    c.toppages         :limit => 10
    
historical calls and options

    c.alerts           :since =>
    c.snapshots        :timestamp =>
    c.stats
    c.data_series
    c.day_data_series
    
other calls and options

    c.histogram        :keys => 'n', :breaks => 'n', :path => '/'
    c.summary          :keys => 'n', :types => 'n', :path => '/'
    
## Note on Patches/Pull Requests
 
* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

## Copyright

Copyright (c) 2010 Al Shaw. See LICENSE for details.
