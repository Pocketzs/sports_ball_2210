class Player
  def initialize(name, monthly_cost, contract_length)
    @name = name
    @monthly_cost = monthly_cost
    @contract_length = contract_length
  end

  def first_name
    @name.split(' ')[0]
  end

  def last_name
      @name.split(' ')[1]
  end

  def monthly_cost
    @monthly_cost
  end
end