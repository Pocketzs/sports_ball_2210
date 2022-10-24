class Team
  attr_reader :name, :city, :roster
  def initialize(name, city)
    @name = name
    @city = city
    @roster = []
  end

  def player_count
    roster.size
  end

  def add_player(player)
    roster << player
  end

  def long_term_players
    roster.select do |player|
      player.contract_length > 24
    end
  end

  def short_term_players
    roster.select do |player|
      player.contract_length <=24
    end
  end

  def total_value 
    roster.reduce(0) do |sum, player| 
      sum + player.total_cost 
    end
  end

  def details
    details = Hash.new 
    details["total_value"] = total_value
    details["player_count"] = player_count
    details
  end

  def average_cost_of_player
    average = total_value / player_count
    avg_string = average.to_s.chars
    digit_order = avg_string.reverse
    grouped_nest = digit_order.each_slice(3).to_a
    grouped_arr = grouped_nest.map do |set|
      set.join
    end
    formatted_cost = grouped_arr.join(",").reverse
    "$#{formatted_cost}"
  end

  def players_by_last_name
    alpha_names = roster.sort_by do |player|
      player.last_name.downcase
    end
    name_arr = alpha_names.map do |player|
      player.last_name
    end
    name_arr.join(", ")
  end
end