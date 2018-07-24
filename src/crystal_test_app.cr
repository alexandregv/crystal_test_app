require "./crystal_test_app/*"
require "benchmark"

# Base module for `CrystalTestApp`
module CrystalTestApp
  CHOICES = ["Hello World",
             "Looper",
             "Web Server",
             "Fibonacci",
             "Files Concatenator",
             "Lines Counter"] of String

  at_exit { puts "\nGoodbye!" }

  puts "Welcome to this Crystal Test App!"
  puts "If you expect to see something useful here, you are not at the good place :-)\n\n"

  @@first_run = true
  start

  def self.menu
    puts "\n--------------------\n" unless @@first_run
    @@first_run = false

    puts "Please, choose the module you want to launch:"

    CHOICES.each_with_index do |choice, index|
      puts "#{index + 1}. #{choice}"
    end
    puts "0. Quit\n"

    {% begin %}
    case gets
      {% for choice, index in CHOICES %}
      when "{{index + 1}}"
        CrystalTestApp::Modules::{{choice.strip.tr(" ", "").id}}.new
      {% end %}
      when "0"
        exit
      else
        menu
    end
    {% end %}
  end

  def self.start
    menu
  end
end
