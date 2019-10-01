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
    if sender.valid? == false || !sender.name
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif valid?
      sender.balance = sender.balance - amount
      receiver.balance = receiver.balance + amount
      @status = "complete"
    end
      "Transaction rejected. Please check your account balance."
  end

      def reverse_transfer
        if @status == "complete"
          sender.balance = sender.balance + amount
          receiver.balance = receiver.balance - amount
          @status = "reversed"
        end
      end
  end
