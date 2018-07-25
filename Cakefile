require "colorize"

module Cakefile
  APP_NAME = "CrystalTestApp"

  @@tasks_ran = 0
  @@errors = 0
  @@errored = {} of String => Bool
  @@status = 0

  at_exit do
    exit if @@tasks_ran == 0

    puts "\n\n"
    @@errored.each { |t, e| puts "   => #{t}".colorize.fore(e ? :light_red : :light_green) }

    if @@errors == 0
      puts "\n\n   #{"All Cake tasks ended!".colorize.fore(:light_cyan).mode(:underline)}   \n"
      exit(0)
    else
      puts "\n\n   #{"#{@@errors} task#{@@errors > 1 ? "s" : ""} ended with error.".colorize.fore(:light_red).mode(:underline)}   \n"
      exit(1)
    end
  end


  desc "format, spec, docs, build"
  task :default do
    tasks = %w[format spec docs build]
    tasks.each do |t|
      puts "\n"
      invoke! t
    end
  end

  desc "format_check, spec, docs, build"
  task :travis do
    tasks = %w[format_check spec docs build]
    tasks.each do |t|
      puts "\n"
      invoke! t
    end
  end


  desc "Check code formatting"
  task :format_check do
    log "Checking code formatting..."
    puts `crystal tool format --check`
    @@status = $?.exit_code
    log "Code is well formatted!", "Code is bad formatted, check the norm!"
    summary_add "Format check"
  end

  desc "Run code formatter"
  task :format do
    log "Formatting code..."
    puts `crystal tool format`
    @@status = $?.exit_code
    log "Code formatted!", "Couldn't format code!"
    summary_add "Format"
  end

  desc "Run spec (tests)"
  task :spec do
    log "Running specs..."
    puts `crystal spec`
    @@status = $?.exit_code
    log "Specs passed successfully!", "Specs didn't passed, check logs!"
    summary_add "Specs"
  end

  desc "Generate docs"
  task :docs do
    log "Generating docs..."
    puts `crystal docs`
    @@status = $?.exit_code
    log "Docs generated!"
    summary_add "Docs"
  end

  desc "Build release/production binary"
  task :build do
    log "Building release/production binary..."
    puts `shards build --production --release`
    @@status = $?.exit_code
    log "Binary built! (./bin/#{APP_NAME.underscore})", "Couldn't build the binary."
    summary_add "Build release binary"
  end

  desc "Build development binary"
  task :build_dev do
    log "Building development binary..."
    puts `shards build`
    @@status = $?.exit_code
    log "Binary built! (./bin/#{APP_NAME.underscore})", "Couldn't build the binary."
    summary_add "Build development binary"
  end


  def self.puts(str : String)
    if str != nil && str != ""
      STDOUT.puts str
    end    
  end

  def self.log(success = "Success!", error = "Error!")
    @@tasks_ran = 1
    if @@status == 0
      puts "#{">> ".colorize.light_cyan} #{success}"
    else
      puts "#{">> ".colorize.light_red} #{error}"
      @@errors += 1
    end
  end

  def self.summary_add(task : String)
    @@errored[task] = (@@status != 0)
    @@status = 0
  end
end
