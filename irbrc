require 'irb/completion'
require 'rubygems'

begin
  require 'wirble'
  Wirble.init
  Wirble.colorize
  require 'hirb'
  Hirb.enable
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
  ActiveRecord::Base.logger = Logger.new STDOUT
  ActiveRecord::Base.clear_reloadable_connections!
  ActionController::Base.logger = Logger.new STDOUT

  # console custom prompt
  app_name = Rails.application.class.parent_name.downcase
  app_env  = Rails.env[0...3]
  IRB.conf[:PROMPT] ||= {}
  IRB.conf[:PROMPT][:RAILS] = {
    :PROMPT_I => "#{ app_name }(#{ app_env })> ",
    :PROMPT_N => "#{ app_name }(#{ app_env })| ",
    :PROMPT_C => "#{ app_name }(#{ app_env })| ",
    :PROMPT_S => "#{ app_name }(#{ app_env })%l ",
    :RETURN => "=> %s\n", :AUTO_INDENT => true,
  }
  IRB.conf[:PROMPT_MODE] = :RAILS

  # SQL helpers
  def sql(query)
    ActiveRecord::Base.connection.select_all(query)
  end

  def sql_ex(query)
    ActiveRecord::Base.connection.execute(query)
  end

  def show_tables
    sql_ex("show tables").map.flatten
  end

  def show_cols(klass)
    y klass.columns.map(&:name).sort
  end
end
