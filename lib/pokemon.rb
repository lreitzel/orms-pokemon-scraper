class Pokemon
    attr_accessor :name, :id, :type, :db
    
    def initialize(name:, id:, type:, db:)
        @name = name
        @id = id
        @type = type
        @db = db
    end

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    end

    def self.find(id_num, db)
        pokemon_info = db.execute("SELECT * FROM pokemon WHERE id=?", id_num).flatten
        Pokemon.new(id: pokemon_info[0], name: pokemon_info[1], type: pokemon_info[2], db: db)
    end
    

end
