module Rubychy
  module DataTypes
    class Keyboards < Rubychy::DataTypes::Base
      attribute :keyboards, Array[Keyboard]

      def validations
        {
          type: { required: true, class: [String] },
          body: { required: true, class: [String] },
        }
      end
    end
  end
end



