require 'rack-livereload'
 
use Rack::LiveReload
use Rack::Static,
  urls: [""],
  root: '.',
  index: 'index.html'
 
run proc { }
