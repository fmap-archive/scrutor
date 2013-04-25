$:.unshift File.join(File.dirname(__FILE__), "config")

require 'application'

map('/') { run Scrutor }
