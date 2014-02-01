require "bundler"
Bundler.require(:default)

use Rack::Rewrite do
  r302 '/', '/oedo04/'
end

map "/oedo04" do
  run Vienna
end
