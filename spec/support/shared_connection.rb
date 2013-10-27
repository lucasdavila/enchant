# once we set use_transactional_fixtures to true, we need to share the same database connection
# between the webserver and the test suite, this way the webserver will see the data created on test suite.
#
# reference:  http://blog.plataformatec.com.br/2011/12/three-tips-to-improve-the-performance-of-your-test-suite/

class ActiveRecord::Base
  mattr_accessor :shared_connection
  @@shared_connection = nil

  def self.connection
    @@shared_connection || retrieve_connection
  end
end

ActiveRecord::Base.shared_connection = ActiveRecord::Base.connection
