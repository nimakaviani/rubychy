module Rubychy
  module DataTypes
    class Message < Rubychy::DataTypes::Base
      attribute :body, String
      attribute :to, String
      attribute :from, String
      attribute :type, String
      attribute :timestamp, Integer
      attribute :id, String
      attribute :chatId, String
      attribute :readReceiptRequested, Boolean
      attribute :participants, Array[String]
    end
  end
end
