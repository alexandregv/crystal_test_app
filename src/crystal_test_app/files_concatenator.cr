module CrystalTestApp
  module Modules
    class FilesConcatenator
      def initialize
        puts "Dir path (relative to your actual location) ?"
        dir = gets.to_s
        if dir == nil || dir == ""
          dir = "*"
        end

        files = Dir[dir.to_s].reject { |f| File.directory?(f) }
        concat = ""

        files.each do |f|
          concat += "\n\n---------------[ #{File.basename(f)} ]---------------\n\n"
          concat += File.read(f)
        end

        puts concat
      end
    end
  end
end
