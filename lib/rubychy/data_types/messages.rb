module Rubychy
  module DataTypes
    class Messages < Rubychy::DataTypes::Base
      attribute :messages, Array[Message]
    end
  end
end
