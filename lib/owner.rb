class Owner
  attr_accessor :pets, :name
  attr_reader :species

  @@all = []

  def initialize(name)
    @pets = {
      fishes: [],
      dogs: [],
      cats: []
    }
    @name = name
    @species = "human"
    @@all << self
  end

  def self.all
    @@all
  end

  def self.reset_all
    self.all.clear
  end

  def self.count
    self.all.count
  end

  def say_species
    "I am a #{self.species}."
  end

  def buy_cat(name)
    self.pets[:cats] << Cat.new(name)
  end

  def play_with_cats
    self.pets[:cats].each {|cat| cat.mood = "happy"}
  end

  def buy_dog(name)
    self.pets[:dogs] << Dog.new(name)
  end

  def walk_dogs
    self.pets[:dogs].each {|dog| dog.mood = "happy"}
  end

  def buy_fish(name)
    self.pets[:fishes] << Fish.new(name)
  end

  def feed_fish
    self.pets[:fishes].each {|fish| fish.mood = "happy"}
  end

  def sell_pets
    self.pets.each do |animal, animal_array|
      animal_array.each {|pet| pet.mood = "nervous"}
    end

    self.pets.clear
  end

  def list_pets
    statement = "I have"
    self.pets.each do |animal, animal_array|
      if animal == :fishes
        statement += " #{animal_array.count} fish,"
      elsif animal == :dogs
        statement += " #{animal_array.count} dog(s),"
      else
        statement += " and #{animal_array.count} cat(s)."
      end
    end
    statement
  end
end
