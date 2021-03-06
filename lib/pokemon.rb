require 'pry'

class Pokemon
  
  attr_accessor :id, :name, :type, :db, :hp
  
  def initialize(keywords)
 
  end
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end
  
  def self.find(id,db)
    pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
    binding.pry
    new_pokemon = self.new(pokemon)
    new_pokemon.id = pokemon[0][0]
    new_pokemon.name = pokemon[0][1]
    new_pokemon.type = pokemon[0][2]
    new_pokemon.hp = pokemon[0][3]
    return new_pokemon
  end
  
  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, self.id)
    self.hp = hp
  end
  
end
