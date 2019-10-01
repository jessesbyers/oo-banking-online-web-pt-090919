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
    1.times {
    if valid?
        sender.balance = sender.balance - amount
        receiver.balance = receiver.balance + amount
        @status = "complete"

      elsif !sender.valid?
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
    }

      # 1.times {
      # }



  end



end
