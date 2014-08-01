# encoding: utf-8
unless ENV['CI']
  require 'simplecov'
  SimpleCov.start do
    add_group 'Ten', 'lib/tenten'
    add_filter 'spec'
  end
end

require 'tenten'

RSpec.configure do |config|
  config.order = :random
  config.default_formatter = 'doc' if config.files_to_run.one?
  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
  end
end
