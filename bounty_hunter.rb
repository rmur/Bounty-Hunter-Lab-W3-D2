require( 'pg' )



class BountyHunter
  attr_accessor :name, :species, :bounty_value, :homeworld
  attr_reader :id


  def initialize (parameter)
    @name = parameter['name']
    @species = parameter['species']
    @bounty_value = parameter['bounty_value'].to_i
    @homeworld = parameter['homeworld']
    @id = parameter['id'].to_i if parameter['id']
  end

def save()
  db = PG.connect( { dbname: 'bounty_hunter', host: 'localhost'})
sql = 
  "INSERT INTO bounty_hunter
  (name, species, bounty_value, homeworld )
  VALUES
  ('#{@name}', '#{@species}', '#{@bounty_value}', '#{@homeworld}')
  returning id;"
  @id = db.exec(sql)[0]["id"].to_i
  db.close
end

def update()
  db = PG.connect( { dbname: 'bounty_hunter', host: 'localhost'})
  sql = 
  "UPDATE bounty_hunter
  SET (name, species, bounty_value, homeworld ) =
  ('#{@name}', '#{@species}', '#{@bounty_value}', '#{@homeworld}')
  WHERE id = #{@id};"
  db.exec(sql)
  db.close
end

def delete()
  db = PG.connect( { dbname: 'bounty_hunter', host: 'localhost'})
  sql = "DELETE FROM bounty_hunter where id = #{@id};"
  db.exec(sql)
  db.close
end

def self.find(id_input)
  db = PG.connect( { dbname: 'bounty_hunter', host: 'localhost'})
  sql = "SELECT * FROM bounty_hunter WHERE id = #{id_input};"
  all_species = db.exec(sql)
  db.close
  return all_species.map { |species| BountyHunter.new( species ) } 
end

def self.delete_all()
  db = PG.connect( { dbname: 'bounty_hunter', host: 'localhost' } )
  sql = "DELETE from bounty_hunter"
  db.exec(sql)
  db.close
end



end

