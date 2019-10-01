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

    if valid?
      counter = 0
      while counter <= 1
        sender.balance = sender.balance - amount
        receiver.balance = receiver.balance + amount
        @status = "complete"
        counter += 1
        end
      
      else
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
      end

      # 1.times {
      # }



  end



end
