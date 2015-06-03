require 'sinatra/base'
class App < Sinatra::Base

  # ...

  def self.run!
    rack_handler_config = {}

    ssl_options = {
        :private_key_file => Bazuro::CONFIG[:ssl][:key],
        :cert_chain_file => Bazuro::CONFIG[:ssl][:crt],
        :verify_peer => false,
    }

    Rack::Handler::Thin.run(self, rack_handler_config) do |server|
      server.ssl = true
      server.ssl_options = ssl_options
    end
  end
end