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
    message = ""
    if sender.valid? == false
      @status = "rejected"
      message = "Transaction rejected. Please check your account balance."

    elsif valid? && @status == "pending"
        sender.balance = sender.balance - amount
        receiver.balance = receiver.balance + amount
        @status = "complete"
      elsif 
      end
      message
    end

      def reverse_transfer
        if @status == "complete"
          sender.balance = sender.balance + amount
          receiver.balance = receiver.balance - amount
          @status = "reversed"
        end
      end
  end
