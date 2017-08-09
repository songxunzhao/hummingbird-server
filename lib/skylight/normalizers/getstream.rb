module Skylight
  module Normalizers
    class Getstream < Normalizer
      register 'load.getstream'
      register 'follow.getstream'
      register 'unfollow.getstream'

      CAT = 'db.getstream'.freeze

      def normalize(_trace, name, payload)
        feed = payload[:feed].stream_id
        action = name.split('.').first

        title = "#{action.upcase} #{feed}"
        title += " -> #{payload[:target].stream_id}" if payload[:target]
        desc = YAML.dump(payload[:args]) if action == 'load'

        [CAT, title, desc]
      end
    end
  end
end
