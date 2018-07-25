require "colorize"

app_name = "CrystalTestApp"
at_exit { puts "\n\n   #{"All Cake tasks ended!".colorize.fore(:light_cyan).mode(:underline)}   \n" }

task :default do
  tasks = %w[format spec docs build]
  tasks.each do |t|
    puts "\n"
    invoke! t
  end
end

desc "Check code formatting"
task :format_check do
  puts "Checking code formatting..."
  puts `crystal tool format --check`
  puts "Code formatting checked!"
end

desc "Run code formatter"
task :format do
  log "Formatting code..."
  puts `crystal tool format`
  log "Code formatted!"
end

desc "Run spec (tests)"
task :spec do
  log "Running spec..."
  puts `crystal spec`
  log "Spec ran!"
end

desc "Generate docs"
task :docs do
  log "Generating docs..."
  `crystal docs`
  log "Docs generated!"
end

desc "Build release/production binary"
task :build do
  log "Building release/production binary..."
  `shards build --production --release`
  log "Binary built! (./bin/#{app_name.underscore})"
end

desc "Build development binary"
task :build_dev do
  log "Building development binary..."
  `shards build`
  log "Binary built! (./bin/#{app_name.underscore})"
end



def log(*objects)
  print ">> ".colorize.light_cyan
  puts *objects
end
