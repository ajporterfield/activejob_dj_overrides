require "active_support/concern"
require "active_job"

Dir["#{__dir__}/support/*.rb"].each {|file| require file }

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'activejob_dj_overrides'
