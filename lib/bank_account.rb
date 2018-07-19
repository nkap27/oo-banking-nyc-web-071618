class BankAccount
  attr_accessor :balance, :status
  attr_reader :name
  # @@all_accounts = []

  def initialize(name, balance = 1000, status = 'open')
    @name = name
    @balance = balance
    @status = status
    # @@all_accounts << self
  end

  def deposit(amount)
    @balance += amount
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
    @status == "open" && @balance > 0
  end

def close_account
  self.status= "closed"
end

end
