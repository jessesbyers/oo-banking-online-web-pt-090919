require 'pry'

class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if valid? && sender.balance > amount
      #  && @status == "pending"
      sender.balance = sender.balance - amount
      receiver.balance = receiver.balance + amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

# sender.valid? && sender.balance < amount

  def reverse_transfer
    if @status == "complete"
       sender.balance = sender.balance + amount
       receiver.balance = receiver.balance - amount
       @status = "reversed"
     end
    end
  end
