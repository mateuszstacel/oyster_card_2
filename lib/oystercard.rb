class Oystercard


  attr_reader :balance

  LIMIT  = 90

  def initialize
    @balance = 0
  end

  def top_up(amount)
  fail 'Max limit is £#{LIMIT}' if @balance + amount > LIMIT
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

end
