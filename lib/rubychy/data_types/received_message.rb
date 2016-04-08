module Rubychy
  module DataTypes
    class ReceivedMessage < Rubychy::DataTypes::Message
      attribute :from, String
      attribute :timestamp, Integer
      attribute :readReceiptRequested, Boolean
      attribute :participants, Array[String]
      attribute :mention, String
    end
  end
end

