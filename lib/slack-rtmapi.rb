require File.expand_path('../lib/slack-rtmapi/client.rb', __FILE__)
require File.expand_path('../lib/slack-rtmapi/version.rb', __FILE__)

require 'json'
require 'net/http'

module SlackRTM

  def self.get_url(options)
    if options[:token].nil?
      raise ArgumentError.new "#get_url needs a valid slack token"
    end

    url = options[:slack_api_url] || 'https://slack.com/api'
    uri = URI.parse(url + '/rtm.start')
    https = Net::HTTP.new(uri.host, uri.port)
    https.use_ssl = true
    req = Net::HTTP::Post.new(uri.path, { 'Content-Type' => 'application/json' })
    req.set_form_data({ token: options[:token] })
    res = https.request(req)
    body = JSON.parse res.body
    URI(body['url'])
  end

end
