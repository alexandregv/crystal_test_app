require "http/server"

module CrystalTestApp
  module Modules
    class WebServer
      def initialize
        server = HTTP::Server.new do |context|
          context.response.content_type = "text/plain"
          context.response.print "Isn't this WebServer the new Apache ?"
        end

        address = server.bind_tcp 8080

        spawn do
          puts "Listening on http://#{address} … Open your webbrowser at this address!"
          puts "Press [Enter] to stop."
          server.listen
        end

        Fiber.yield
        gets
        CrystalTestApp.start
      end
    end
  end
end
