class Oystercard


  attr_reader :balance

  LIMIT  = 90

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
  fail 'Max limit is £#{LIMIT}' if @balance + amount > LIMIT
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end

end
