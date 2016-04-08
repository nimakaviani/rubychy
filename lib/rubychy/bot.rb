module Rubychy
  class Bot
    API_ENDPOINT = 'https://api.kik.com/v1'

    attr_reader :me

    def initialize(username, api_token)
      @username = username
      @api_token = api_token
      @offset = 0
      @timeout = 60
      @fail_silently = false
      @connection = HTTPClient.new
      @connection.set_auth(nil, @username, @api_token)
    end

    def config(webhook, features = Rubychy::DataTypes::Features.new)
      api_post('config', {webhook: webhook, features: features})
    end

    def send_message(*messages)
      msgs = { messages: sanitize('message', messages) }
      api_post('message', msgs)
    end

    def get_user(username)
      response = api_get("user/#{username}")
      Rubychy::DataTypes::User.new(response.result)
    end

  private

    def sanitize(action, messages)
      validated_params = Array.new
      messages.each do |message|
        # Delete params not accepted by the API
        validated_param = message.to_hash.delete_if { |k, _v|
          !message.validations.key?(k) || message.validations[k][:drop_empty]
        }

        # Check all required params by the action are present
        message.validations.each do |key, _value|
          if message.validations[key][:required] && !validated_param.key?(key)
            fail Rubychy::Errors::MissingParamsError.new(key, action)
          end
        end
        validated_params << validated_param
      end
      return validated_params
    end

    def api_get(action)
      api_uri = "#{action}"
      begin
        response = @connection.get(
          "#{API_ENDPOINT}/#{api_uri}",
          nil
        )

        ApiResponse.new(response,@fail_silently)
      rescue HTTPClient::ReceiveTimeoutError => e
        if !@fail_silently
          fail Rubychy::Errors::TimeoutError, e.to_s
        end
      end
    end

    def api_post(action, params)
      api_uri = "#{action}"

      begin
        response = @connection.post(
          "#{API_ENDPOINT}/#{api_uri}",
          MultiJson.dump(params),
          'Content-Type' => 'application/json'
        )

        ApiResponse.new(response,@fail_silently)
      rescue HTTPClient::ReceiveTimeoutError => e
        if !@fail_silently
          fail Rubychy::Errors::TimeoutError, e.to_s
        end
      end
    end

  end
end
