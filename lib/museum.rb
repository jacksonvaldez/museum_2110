require './lib/exhibit'

class Museum

  attr_reader :name, :exhibits, :patrons

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
    @exhibits.find_all do |exhibit|
      patron.interests.include?(exhibit.name)
    end
  end

  def admit(patron)
    @patrons << patron
  end

  def patrons_by_exhibit_interest
    patrons_sorted = {}
    @exhibits.each do |exhibit|
      patrons_sorted[exhibit.name] = @patrons.find_all { |patron| patron.interests.include?(exhibit.name) }
    end
    patrons_sorted
  end

  def ticket_lottery_contestants(exhibit)
    @patrons.find_all do |patron|
      patron.spending_money < exhibit.cost
    end
  end

  def draw_lottery_winner(exhibit)
    self.ticket_lottery_contestants(exhibit).sample
  end

end
