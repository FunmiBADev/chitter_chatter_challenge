require 'pg'

class Peep

	def self.show_all
		if ENV['ENVIRONMENT'] == 'test'
			connection = PG.connect(dbname: 'chitter_test')
		else
			connection = PG.connect(dbname: 'chitter')
		end
    

    result = connection.exec('SELECT * FROM peeps')
    result.map { |peep| peep['message'] }
	end
end