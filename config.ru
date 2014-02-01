require "bundler"
Bundler.require(:default)

use Rack::StaticCache, urls: %w(/images /javascripts /stylesheets /favicon.ico), :root => "public"
use Rack::ETag
use Rack::Cache
use Rack::Rewrite do
  rewrite '/', '/index.html'
end
run Rack::Directory.new('public')
