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
      api_request('config', {webhook: webhook, features: features})
    end

    def send_message(*messages)
      extra_params_validation = {
        body: { required: true, class: [String] },
        to: { required: true, class: [String] },
        type: { required: true, class: [String] },
        chatId: { required: true, class: [String] },
      }

      send_something('message', messages, extra_params_validation)
    end

    def send_something action, messages, validations
      params = { messages: sanitize(action, messages, validations) }
      api_request(action, params)
    end

  private

    def sanitize(action, params, validations)
      if validations.nil?
        return params
      end

      validated_params = Array.new
      params.each do |param|
        # Delete params not accepted by the API
        validated_param = param.to_hash.delete_if { |k, _v| !validations.key?(k) }

        # Check all required params by the action are present
        validations.each do |key, _value|
          if validations[key][:required] && !validated_param.key?(key)
            fail Rubychy::Errors::MissingParamsError.new(key, action)
          end
        end
        validated_params << validated_param
      end
      return validated_params
    end

    def api_request(action, params)
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
