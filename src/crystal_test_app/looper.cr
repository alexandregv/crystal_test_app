module CrystalTestApp
  module Modules
    class Looper
      def initialize
        puts "How many times do you want to loop ?"
        n = gets
        if n.as(String).to_i?
          n.as(String).to_i.times { |i| puts "Iteration ##{i + 1}" }
        else
          puts "Please provide a valid number."
          self.initialize
        end
        CrystalTestApp.start
      end
    end
  end
end
