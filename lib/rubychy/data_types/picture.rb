module Rubychy
  module DataTypes
    class Picture < Rubychy::DataTypes::SentMessage
      attribute :picUrl, String
      attribute :attribution, String, :default => "gallery"

      def initialize *params
        super(*params)
        @type = 'picture'
      end

      def validations
        {
          picUrl: { required: true, class: [String] },
          to: { required: true, class: [String] },
          type: { required: true, class: [String] },
          chatId: { required: true, class: [String] },
        }
      end
    end
  end
end


