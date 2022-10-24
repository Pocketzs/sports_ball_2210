class Team
  attr_reader :name, :city, :roster
  def initialize(name, city)
    @name = name
    @city = city
    @roster = []
  end
end