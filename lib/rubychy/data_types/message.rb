module Rubychy
  module DataTypes
    class Message < Rubychy::DataTypes::Base
      attribute :type, String
      attribute :id, String
      attribute :chatId, String
      attribute :keyboards, Array[Keyboard]
    end
  end
end
