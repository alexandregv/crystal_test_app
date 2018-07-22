module CrystalTestApp
  module Modules
    class LinesCounter
      def initialize
        channel = Channel(Int32).new
        total_lines = 0

        puts "Dir path (relative to your actual location) ?"
        dir = gets.to_s
        if dir == nil || dir == ""
          dir = "*"
        end

        files = Dir[dir.to_s].reject { |f| File.directory?(f) }

        files.each do |f|
          spawn do
            lines = File.read(f).lines.size
            channel.send lines
          end
        end

        files.size.times do
          total_lines += channel.receive
        end

        puts total_lines
      end
    end
  end
end
