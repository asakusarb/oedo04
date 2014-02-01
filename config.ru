require "bundler"
Bundler.require(:default)

use Rack::Rewrite do
  r302 '/', '/oedo04/'
  rewrite '/', '/index.html'
end

run Rack::URLMap.new({"/oedo04" => Vienna})
