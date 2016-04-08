module Rubychy
  module DataTypes
    class ReceivedMessages < Rubychy::DataTypes::Base
      attribute :messages, Array[ReceivedMessage]
    end
  end
end
