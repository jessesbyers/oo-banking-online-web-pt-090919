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
    if valid? && @status != "complete"
        sender.balance = sender.balance - amount
        receiver.balance = receiver.balance + amount
        @status = "complete"
      elsif !sender.valid?
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
      end

      def reverse_transfer
        if @status == "complete"
          sender.balance = sender.balance + amount
          receiver.balance = receiver.balance - amount
        end
      end
  end



end
