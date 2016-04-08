module Rubychy
  module DataTypes
    class User < Rubychy::DataTypes::Base
      attribute :firstName, String
      attribute :lastName, String
      attribute :profilePicUrl, String
      attribute :profilePicLastModified, Integer
    end
  end
end



