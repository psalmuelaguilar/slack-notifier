# frozen_string_literal: true

module Slack
  class Notifier
    class PayloadMiddleware
      class << self
        def registry
          @registry ||= {}
        end

        def register middleware, name
          registry[name] = middleware
        end
      end
    end
  end
end

%w(stack base format_message format_attachments at channels).each do |md|
  require(File.expand_path("payload_middleware/#{md}", File.dirname(__FILE__)))
end
