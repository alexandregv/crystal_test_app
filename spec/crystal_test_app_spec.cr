require "./spec_helper"
require "http/server"

module CrystalTestApp
  def self.start
  end
end

describe "CrystalTestApp#menu(HelloWorld)" do
  it "should say hello" do
    write_in("1", "0")
    CrystalTestApp.menu
    read_out.should eq "Hello, world!"
  end
end

describe "CrystalTestApp#menu(Looper)" do
  it "should loop 3 times" do
    write_in("2", "3", "0")
    CrystalTestApp.menu
    read_out.should eq "Iteration #3"
  end
end

describe "CrystalTestApp#menu(WebServer)" do
  it "should open a websever at 127.0.0.1:8080" do
    write_in("3", "0")
    CrystalTestApp.menu
    # read_out.should eq "Press Ctrl + C to stop."
    response = HTTP::Client.get "127.0.0.1:8080"
    response.status_code.should eq 200
  end
end

describe "CrystalTestApp#menu(Fibonacci)" do
  it "should return 55" do
    write_in("4", "10", "0")
    CrystalTestApp.menu
    read_out.should eq "55"
  end
end

describe "CrystalTestApp#menu(FilesConcatenator)" do
  it "should return 'The MIT License (MIT)'" do
    STDOUT_SPEC.clear
    write_in("5", "LICENSE", "0")
    CrystalTestApp.menu
    STDOUT_SPEC.rewind
    read_out.should eq "The MIT License (MIT)"
  end
end

describe "CrystalTestApp#menu(LinesCounter)" do
  it "should return 21" do
    write_in("6", "LICENSE", "0")
    CrystalTestApp.menu
    read_out.should eq "21"
  end
end
