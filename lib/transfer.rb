class Transfer
attr_accessor :sender, :receiver, :status, :amount

def initialize(sender, receiver, status="pending", amount)
  @sender = sender
  @receiver = receiver
  @status = status
  @amount = amount
end

def valid?
  sender.valid? && receiver.valid?
end

def execute_transaction
  #check if sender has enough funds
  if @status == "pending"

    if sender.balance >= @amount
      receiver.deposit(@amount)
      sender.balance -= @amount
      @status = "complete"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  else
    return
  end
end

def reverse_transfer
  if @status == "complete"
    @status = "reversed"
    receiver.balance -= @amount
    sender.deposit(@amount)

  end
end

end #end transfer class
