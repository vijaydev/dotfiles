require 'irb/completion'
require 'rubygems'

begin
  if defined?(Wirble)
    require 'wirble'
    Wirble.init
    Wirble.colorize
  end
  if defined?(Hirb)
    require 'hirb' 
    #Hirb.enable
  end
rescue
end

class Class
  def descendants
    ObjectSpace.each_object(::Class).select { |c| c < self }
  end
end

require 'benchmark'
def time(times = 1)
  unless block_given?
    puts "No block provided"
    return
  end

  ret = nil
  Benchmark.bm do |x|
    x.report { times.times { ret = yield } }
  end
  ret
end

if ENV['RAILS_ENV'] || defined? Rails
  #http://rbjl.net/49-railsrc-rails-console-snippets
  # logging
  #ActiveRecord::Base.logger = Logger.new STDOUT
  #ActiveRecord::Base.clear_reloadable_connections!
  #ActionController::Base.logger = Logger.new STDOUT

  begin
    J = Delayed::Job
  rescue
  end

  # console custom prompt
  app_name = Rails.application.class.parent_name.downcase
  app_env  = Rails.env[0].chr.upcase
  app_db   = ActiveRecord::Base.configurations[Rails.env]["database"]
  #IRB.conf[:USE_READLINE] = false
  #IRB.conf[:PROMPT] ||= {}
  #IRB.conf[:PROMPT][:RAILS] = {
    #:PROMPT_I => "#{ app_env }-#{ app_db }> ",
    #:PROMPT_N => "#{ app_env }-#{ app_db }| ",
    #:PROMPT_C => "#{ app_env }-#{ app_db }| ",
    #:PROMPT_S => "#{ app_env }-#{ app_db }%l ",
    #:RETURN => "=> %s\n", :AUTO_INDENT => true,
  #}
  #IRB.conf[:PROMPT_MODE] = :RAILS
  RC = Rails.cache
  RCC = Rails.cache.clear

  # SQL helpers
  def arb
    ActiveRecord::Base
  end

  def sql(query)
    ActiveRecord::Base.connection.select_all(query)
  end

  def sql_ex(query)
    ActiveRecord::Base.connection.execute(query)
  end

  def show_tables
    sql_ex("show tables").map.flatten
  rescue
    sql_ex("show tables").to_a.flatten
  end

  def show_cols(klass)
    y klass.columns.map(&:name).sort
  end
end
