# Defines our constants
PADRINO_ENV  = ENV['PADRINO_ENV'] ||= ENV['RACK_ENV'] ||= 'development'  unless defined?(PADRINO_ENV)
PADRINO_ROOT = File.expand_path('../..', __FILE__) unless defined?(PADRINO_ROOT)

# Load our dependencies
require 'rubygems' unless defined?(Gem)
require 'bundler/setup'
Bundler.require(:default, PADRINO_ENV)

# 兼容 Rails
module Rails
  def self.root
    PADRINO_ROOT
  end
  def self.logger
    Padrino.logger
  end
end

if Padrino.env == :development
  require 'awesome_print'
  require 'better_errors'

  if defined? BetterErrors # 
    Padrino::Application.use BetterErrors::Middleware
    BetterErrors.application_root = PADRINO_ROOT
    BetterErrors.editor = :sublime
    BetterErrors.logger = Padrino.logger
  end

  Padrino.logger.colorize!
end

I18n.default_locale = :zh_cn

##
# Add your before (RE)load hooks here
#
Padrino.before_load do
  
  if defined? Mongoid # 数据库
  Mongoid.load!(Padrino.root('config/mongoid.yml'), Padrino.env)
  # 设定日志
    Mongoid.logger = Padrino.logger
      Moped.logger = Padrino.logger
  end

  if defined? CarrierWave # 文件上传
    CarrierWave.configure do |config|
        config.storage = :file
      config.cache_dir = Padrino.root('tmp/uploads')
           config.root = File.join(Padrino.root, 'public')
    end
  end
end

##
# Add your after (RE)load hooks here
#
Padrino.after_load do
  # 缂栫爜澶勭悊
  unless RUBY_VERSION < '1.9'
    Encoding.default_internal = nil
  end
  Time.zone = 'Beijing'
end

Padrino.load!