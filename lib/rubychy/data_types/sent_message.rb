module Rubychy
  module DataTypes
    class SentMessage < Rubychy::DataTypes::Message
      attribute :to, String
      attribute :delay, Integer

      def validations
        fail('not implemented')
      end
    end
  end
end

