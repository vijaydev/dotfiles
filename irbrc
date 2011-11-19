require 'irb/completion'
require 'rubygems'
require 'wirble'
Wirble.init
Wirble.colorize

class Class
  def descendants
    ObjectSpace.each_object(::Class).select { |c| c < self }
  end
end

#require 'logger'
#if ENV.include?('RAILS_ENV') && !Object.const_defined?('RAILS_DEFAULT_LOGGER')
#  Object.const_set('RAILS_DEFAULT_LOGGER', Logger.new(STDOUT))
#end

railsrc_path = File.expand_path('~/.railsrc')
if ( ENV['RAILS_ENV'] || defined? Rails ) && File.exist?( railsrc_path )
  begin
    load railsrc_path
  rescue Exception
    warn "Could not load: #{ railsrc_path }" # because of $!.message
  end
end
