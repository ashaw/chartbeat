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
    c.quickstats       :path => '/'
    c.toppages         :limit => 10
    
historical calls and options

    c.alerts           :since => 1276980619
    c.snapshots        :timestamp => 1276980619
    c.stats
    c.data_series      #not working right now
    c.day_data_series  :timestamp => 1276980619, :type => 'paths'
    
other calls and options

    c.histogram        :keys => 'n', :breaks => 'n', :path => '/'
    c.summary          :keys => 'n', :types => 'n', :path => '/'

Deprecated methods

    c.summize #use quickstats instead
    
## Notes

* Chartbeat is currently returning blank arrays for `alerts` and an error for `data_series` at this time. I'll put out an update with tests for these calls when this is fixed.

* For calls requiring timestamp, this gem defaults to 24 hours ago.

## Copyright

Copyright (c) 2010 Al Shaw. See LICENSE for details.
