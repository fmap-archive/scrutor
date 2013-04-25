%w{cgi toml sinatra dm-core dm-timestamps dm-migrations}.map &method(:require)

API_ROOT = File.join(File.dirname(__FILE__), "..")

DataMapper.setup(:default, "sqlite://#{API_ROOT}/db/database.db")

def require_the_lot_of them
  glob = File.join(API_ROOT, them, "*.rb")
  Dir[glob].each { |f| require f }
end

require_the_lot_of "app/models" and DataMapper.finalize and DataMapper.auto_upgrade!
require_the_lot_of "app/controllers"
