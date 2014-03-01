require "bundler"
Bundler.require(:default)

use Rack::CommonLogger

use Rack::Rewrite do
  r302 '/', '/oedo04/'
  # https://github.com/ruby/www.ruby-lang.org/blob/master/config.ru#L12
  r302 %r{.*}, "$&/", if: ->(rack_env) {
    !rack_env["PATH_INFO"].match(/css|png/) && rack_env["PATH_INFO"].match(%r{/$}).nil?
  }
end

use Rack::Protection::HttpOrigin
use Rack::Protection::FrameOptions

map "/oedo04" do
  run Vienna
end
