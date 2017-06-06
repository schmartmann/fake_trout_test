require 'zlib' 


db = URI.parse(ENV['DATABASE_URL'] || 'postgres://dasboogaloo@localhost:5432/fake_trout_test_db')

ActiveRecord::Base.establish_connection(
  :adapter => db.scheme == 'postgres' ? 'postgresql' : db.scheme, 
  :host => db.host, 
  :username => db.user, 
  :password => db.password, 
  :database => db.path[1..-1], 
  :encoding => 'utf8' 
)

