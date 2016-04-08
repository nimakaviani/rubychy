module Rubychy
  module DataTypes
    class KeyboardResponse
      attribute :type, String
      attribute :body, String

      def validations
        {
          type: { required: true, class: [String] },
          body: { required: true, class: [String] },
        }
      end
    end
  end
end


