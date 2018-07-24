module CrystalTestApp
  module Modules
    class Fibonacci
      def initialize
        puts "Fibonacci(n) ?"
        n = gets
        if n.as(String).to_i?
          puts fibonacci(n.as(String).to_i - 1)
        else
          puts "Please provide a valid integer."
          self.initialize
        end
        CrystalTestApp.start
      end

      def fibonacci(n)
        if n <= 1
          1
        else
          fibonacci(n - 2) + fibonacci(n - 1)
        end
      end
    end
  end
end
