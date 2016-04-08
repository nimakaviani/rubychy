module Rubychy
  module DataTypes
    class Link < Rubychy::DataTypes::SentMessage
      attribute :url, String
      attribute :title, String, :default => ""
      attribute :text, String, :default => ""
      attribute :noForward, Boolean, :default => false

      def initialize *params
        super(*params)
        @type = 'link'
      end

      def validations
        {
          url: { required: true, class: [String] },
          title: { required: false, drop_empty: true, class: [String] },
          text: { required: false, drop_empty: true, class: [String] },
          to: { required: true, class: [String] },
          type: { required: true, class: [String] },
          chatId: { required: true, class: [String] },
        }
      end
    end
  end
end



