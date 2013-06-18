source 'http://ruby.taobao.org'
ruby '1.9.3'

# Server requirements
gem 'oj' # JSON
gem 'rb-readline', '~> 0.4.2'
gem 'tilt', '1.3.7'

# Project requirements
gem 'rake'
gem 'sinatra-flash', require: 'sinatra/flash'

# Component requirements
gem 'erubis',  '>= 2.7.0' # erb 引擎
gem 'mongoid', '~> 3.0.0' # MongoDB
gem 'enumerize'           # 枚举
gem 'state_machine'       # 状态切换 引擎
gem 'kaminari', '>= 0.13.0', require: 'kaminari/sinatra' # 分页

# Uploader requirements
gem 'carrierwave-mongoid', require: 'carrierwave/mongoid' # handles storage & thumbnailing
gem 'carrierwave-imagesorcery'   # 图片处理
gem 'carrierwave-imageoptimizer' # 图片优化
gem 'rack-raw-upload'

# Padrino Stable Gem
gem 'padrino', '0.10.7'
gem 'padrino-rpm' # 监控
gem 'sinatra-simple-navigation', '3.6.0', :require => 'sinatra/simple-navigation' # 导航

gem 'redis-rack',  require: 'rack/session/redis'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'awesome_print'
end

gem 'roo'
gem 'mongoid_auto_increment_id'
gem 'mongoid_taggable_on'